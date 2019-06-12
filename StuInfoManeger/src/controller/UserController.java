package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.impl.BanjiDaoImpl;
import dao.impl.StudentDaoImpl;
import dao.impl.UserDaoImpl;
import pojo.Banji;
import pojo.Student;
import pojo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserDaoImpl udi;
	@Autowired
	private StudentDaoImpl sdi;
	@Autowired
	private BanjiDaoImpl bdi;

	@RequestMapping("/login")
	public @ResponseBody String loginCheck(@RequestBody User user, HttpSession session) {
		User objUser = udi.queryUserById(user.getId());
		if (objUser.getPassword().equals(user.getPassword())) {
			session.setAttribute("user", objUser);
			return objUser.getRole().toString();
		}
		return "false";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		return "login";
	}

	@RequestMapping("/to_stu")
	public String toStuPage(HttpServletRequest req, Model model) {
		User user = (User) req.getSession().getAttribute("user");
		if (user != null && user.getRole() == 1) {
			Student student = sdi.queryById(user.getId());
			Banji banji = bdi.queryById(student.getClassId());
			model.addAttribute("student", student);
			model.addAttribute("banji", banji);
			return "student";
		} else {
			return "login";
		}

	}

	@RequestMapping("/to_adm")
	public String toAdmPage(HttpServletRequest req, Model model) {
		User user = (User) req.getSession().getAttribute("user");
		if (user != null && user.getRole() == 2) {
			return "admin";
		} else {
			return "login";
		}
	}
}
