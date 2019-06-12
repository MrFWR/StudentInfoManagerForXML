package dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.UserDao;
import pojo.User;
import util.XMLOperator;

@Repository
public class UserDaoImpl implements UserDao {
	private final String path = "C:/FwrData/db/user.xml";
	private final String cname = "user";
	@Autowired
	private XMLOperator xo;

	@Override
	public User queryUserById(Long id) {
		// TODO Auto-generated method stub
		Element element = xo.queryById(path, cname, id.toString());
		User user = new User(Long.valueOf(element.getChildText("id")), element.getChildText("password"),
				Integer.valueOf(element.getChildText("role")));
		return user;
	}

	@Override
	public List<User> queryAll() {
		// TODO Auto-generated method stub
		List<Element> elements = xo.queryAll(path, cname);
		List<User> users = new ArrayList<User>();
		for (Element element : elements) {
			User user = new User(Long.valueOf(element.getChildText("id")), element.getChildText("password"),
					Integer.valueOf(element.getChildText("role")));
			users.add(user);
		}
		return users;
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		Element element = new Element(cname);
		element.addContent(new Element("id").setText(user.getId().toString()));
		element.addContent(new Element("password").setText(user.getPassword()));
		element.addContent(new Element("role").setText(user.getRole().toString()));
		xo.add(path, element);
	}

	@Override
	public void updataUser(User user) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("password", user.getPassword());
		xo.update(path, cname, map, user.getId().toString());
	}

	@Override
	public void deleteUser(Long id) {
		// TODO Auto-generated method stub
		xo.delete(path, cname, id.toString());
	}

	public void setXo(XMLOperator xo) {
		this.xo = xo;
	}

}
