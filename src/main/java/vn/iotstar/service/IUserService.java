package vn.iotstar.service;
import vn.iotstar.entity.User;

public interface IUserService {
    void insert(User user);
    void update(User user);
    User findByUsername(String username);
    User findByEmail(String email);
    User login(String username, String password);
}
