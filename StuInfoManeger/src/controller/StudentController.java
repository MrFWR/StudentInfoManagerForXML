package controller;

import java.util.ArrayList;
import java.util.List;

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
import pojo.StudentInfo;
import pojo.User;

@Controller
@RequestMapping("/stu")
public class StudentController {
	@Autowired
	private StudentDaoImpl sdi;
	@Autowired
	private BanjiDaoImpl bdi;
	@Autowired
	private UserDaoImpl udi;

	@RequestMapping("/update")
	public @ResponseBody String updateStu(@RequestBody Student student) {
		boolean b = sdi.updateStu(student);
		if (b == true) {
			return "true";
		}
		return "false";
	}

	@RequestMapping("/all")
	public @ResponseBody List<StudentInfo> queryAll() {
		List<StudentInfo> stuInfos = new ArrayList<StudentInfo>();
		List<Student> students = sdi.queryAll();
		for (Student student : students) {
			Banji banji = bdi.queryById(student.getClassId());
			User user = udi.queryUserById(student.getId());
			StudentInfo sif = new StudentInfo();
			sif.setBanji(banji);
			sif.setStudent(student);
			sif.setUser(user);
			stuInfos.add(sif);
		}
		return stuInfos;
	}

	@RequestMapping("/id")
	public @ResponseBody StudentInfo queryById(@RequestBody Student student) {
		Student stu = sdi.queryById(student.getId());
		if (stu == null) {
			return null;
		}
		Banji banji = bdi.queryById(stu.getClassId());
		User user = udi.queryUserById(stu.getId());
		StudentInfo sif = new StudentInfo();
		sif.setBanji(banji);
		sif.setStudent(stu);
		sif.setUser(user);
		return sif;
	}

	@RequestMapping("/deleteById")
	public String deleteById(Long id) {
		sdi.deleteStu(id);
		return "student_info";
	}

	@RequestMapping("/to_updateInfo")
	public String toUpdateInfo(Long id, Model model) {
		Student stu = sdi.queryById(id);
		Banji banji = bdi.queryById(stu.getClassId());
		User user = udi.queryUserById(stu.getId());
		model.addAttribute("student", stu);
		model.addAttribute("banji", banji);
		model.addAttribute("user", user);
		return "student_info_update";
	}

	@RequestMapping("/updateInfo")
	public @ResponseBody String updateInfo(@RequestBody Student stu) {

		Student oldStu = sdi.queryById(stu.getId());
		User user = udi.queryUserById(stu.getId());

		user.setPassword(stu.getPassword());
		udi.updataUser(user);

		if (oldStu.getClassId() != stu.getClassId()) {

			Banji oldBanji = bdi.queryById(oldStu.getClassId());
			Banji newBanji = bdi.queryById(stu.getClassId());

			if (newBanji == null) {
				return "false";
			}
			oldBanji.setStudentNumber(oldBanji.getStudentNumber() - 1);

			newBanji.setStudentNumber(newBanji.getStudentNumber() + 1);

			sdi.updateStuInfo(stu);
			bdi.updateClass(oldBanji);
			bdi.updateClass(newBanji);
			return "true";
		}

		return "false";
	}

	@RequestMapping("/toAddStuInfo")
	public String toAddStuInfo() {
		return "addStudent";
	}

	@RequestMapping("/addStuInfo")
	public @ResponseBody String addStuInfo(@RequestBody Student stu) {
		Student student = sdi.queryById(stu.getId());
		Banji banji = bdi.queryById(stu.getClassId());
		if (student != null || banji == null) {
			return "false";
		} else {
			User user = new User(stu.getId(), stu.getPassword(), 1);
			banji.setStudentNumber(banji.getStudentNumber() + 1);
			bdi.updateClass(banji);
			udi.addUser(user);
			sdi.addStu(stu);
			return "true";
		}
	}
	@RequestMapping("/toStudentPage")
	public String toStudentPage() {
		return "student_info";
	}
}
