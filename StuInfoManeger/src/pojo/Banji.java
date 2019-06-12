package pojo;

public class Banji {
	private Integer id;
	private String className;
	private String department;
	private Integer studentNumber;

	public Banji() {

	}

	public Banji(Integer id, String className, String department, Integer studentNumber) {
		this.id = id;
		this.className = className;
		this.department = department;
		this.studentNumber = studentNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(Integer studentNumber) {
		this.studentNumber = studentNumber;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return id + "," + className + "," + department + "," + studentNumber;
	}
}
