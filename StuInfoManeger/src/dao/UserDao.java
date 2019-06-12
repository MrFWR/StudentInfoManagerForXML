package dao;

import java.util.List;

import pojo.User;

public interface UserDao {
	public User queryUserById(Long id);
	public List<User> queryAll();
	public void addUser(User user);
	public void updataUser(User user);
	public void deleteUser(Long id);
}
