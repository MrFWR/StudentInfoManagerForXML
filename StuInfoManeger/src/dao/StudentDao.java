package dao;

import java.util.List;

import pojo.Student;

public interface StudentDao {
	public void addStu(Student student);

	public void deleteStu(Long id);

	public boolean updateStu(Student student);

	public Student queryById(Long id);

	public List<Student> queryAll();

	public void updateStuInfo(Student student);
}
