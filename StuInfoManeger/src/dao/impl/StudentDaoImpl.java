package dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.StudentDao;
import pojo.Student;
import util.XMLOperator;

@Repository
public class StudentDaoImpl implements StudentDao {
	private final String path = "C:/FwrData/db/student.xml";
	private final String cname = "student";
	@Autowired
	private XMLOperator xo;

	@Override
	public void addStu(Student student) {
		// TODO Auto-generated method stub
		Element element = new Element(cname);
		element.addContent(new Element("id").setText(student.getId().toString()));
		element.addContent(new Element("name").setText(student.getName()));
		element.addContent(new Element("sex").setText(student.getSex()));
		element.addContent(new Element("age").setText(student.getAge().toString()));
		element.addContent(new Element("classId").setText(student.getClassId().toString()));
		element.addContent(new Element("tel").setText(student.getTel()));
		xo.add(path, element);
	}

	@Override
	public void deleteStu(Long id) {
		// TODO Auto-generated method stub
		xo.delete(path, cname, id.toString());
	}

	@Override
	public boolean updateStu(Student student) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("age", student.getAge().toString());
		map.put("tel", student.getTel());
		xo.update(path, cname, map, student.getId().toString());
		return true;
	}

	@Override
	public Student queryById(Long id) {
		// TODO Auto-generated method stub
		Element element = xo.queryById(path, cname, id.toString());
		if (element == null) {
			return null;
		}
		Student student = new Student(Long.valueOf(element.getChildText("id")), element.getChildText("name"),
				element.getChildText("sex"), Integer.valueOf(element.getChildText("age")),
				Integer.valueOf(element.getChildText("classId")), element.getChildText("tel"));
		return student;
	}

	@Override
	public List<Student> queryAll() {
		// TODO Auto-generated method stub
		List<Element> elements = xo.queryAll(path, cname);
		List<Student> students = new ArrayList<Student>();
		for (Element element : elements) {
			Student student = new Student(Long.valueOf(element.getChildText("id")), element.getChildText("name"),
					element.getChildText("sex"), Integer.valueOf(element.getChildText("age")),
					Integer.valueOf(element.getChildText("classId")), element.getChildText("tel"));
			students.add(student);
		}
		return students;
	}

	@Override
	public void updateStuInfo(Student student) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", student.getName());
		map.put("classId", student.getClassId().toString());
		map.put("age", student.getAge().toString());
		map.put("tel", student.getTel());
		xo.update(path, cname, map, student.getId().toString());
	}

}
