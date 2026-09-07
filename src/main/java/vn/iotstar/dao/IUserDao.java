package vn.iotstar.dao;
import vn.iotstar.entity.User;

public interface IUserDao {
    void insert(User user);
    void update(User user);
    User findByUsername(String username);
    User findByEmail(String email);
}
