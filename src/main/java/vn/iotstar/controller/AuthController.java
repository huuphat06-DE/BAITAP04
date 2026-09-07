package vn.iotstar.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtil;

@WebServlet(urlPatterns = { "/login", "/register", "/verify", "/forgot-password", "/reset-password", "/logout" })
public class AuthController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("/login")) {
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else if (url.contains("/register")) {
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        } else if (url.contains("/verify")) {
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        } else if (url.contains("/forgot-password")) {
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        } else if (url.contains("/reset-password")) {
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        } else if (url.contains("/logout")) {
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("/login")) {
            String uname = req.getParameter("username");
            String pass = req.getParameter("password");
            User user = userService.login(uname, pass);
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("account", user);
                resp.sendRedirect(req.getContextPath() + "/home");
            } else {
                req.setAttribute("error", "Username/Password sai hoặc tài khoản chưa kích hoạt!");
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            }
        } else if (url.contains("/register")) {
            String uname = req.getParameter("username");
            String pass = req.getParameter("password");
            String email = req.getParameter("email");
            
            if (userService.findByUsername(uname) != null || userService.findByEmail(email) != null) {
                req.setAttribute("error", "Username hoặc Email đã tồn tại!");
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
                return;
            }

            User user = new User();
            user.setUsername(uname);
            user.setPassword(pass);
            user.setEmail(email);
            user.setActive(false);
            
            String otp = generateOTP();
            user.setOtpCode(otp);
            user.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));
            userService.insert(user);
            
            try {
                EmailUtil.sendOtpEmail(email, otp);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            req.getSession().setAttribute("verify_email", email);
            resp.sendRedirect(req.getContextPath() + "/verify");

        } else if (url.contains("/verify")) {
            String otp = req.getParameter("otp");
            String email = (String) req.getSession().getAttribute("verify_email");
            User user = userService.findByEmail(email);
            if (user != null && user.getOtpCode() != null && user.getOtpCode().equals(otp)) {
                if (LocalDateTime.now().isBefore(user.getOtpExpiryTime())) {
                    user.setActive(true);
                    user.setOtpCode(null);
                    user.setOtpExpiryTime(null);
                    userService.update(user);
                    
                    if (req.getSession().getAttribute("reset_mode") != null) {
                        resp.sendRedirect(req.getContextPath() + "/reset-password");
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/login");
                    }
                } else {
                    req.setAttribute("error", "OTP đã hết hạn!");
                    req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("error", "OTP không đúng!");
                req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            }
        } else if (url.contains("/forgot-password")) {
            String email = req.getParameter("email");
            User user = userService.findByEmail(email);
            if (user != null) {
                String otp = generateOTP();
                user.setOtpCode(otp);
                user.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));
                userService.update(user);
                try {
                    EmailUtil.sendOtpEmail(email, otp);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                req.getSession().setAttribute("verify_email", email);
                req.getSession().setAttribute("reset_mode", true);
                resp.sendRedirect(req.getContextPath() + "/verify");
            } else {
                req.setAttribute("error", "Email không tồn tại!");
                req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            }
        } else if (url.contains("/reset-password")) {
            String newPass = req.getParameter("password");
            String email = (String) req.getSession().getAttribute("verify_email");
            User user = userService.findByEmail(email);
            if (user != null) {
                user.setPassword(newPass);
                userService.update(user);
                req.getSession().removeAttribute("verify_email");
                req.getSession().removeAttribute("reset_mode");
                resp.sendRedirect(req.getContextPath() + "/login");
            }
        }
    }

    private String generateOTP() {
        Random rand = new Random();
        return String.format("%06d", rand.nextInt(1000000));
    }
}
