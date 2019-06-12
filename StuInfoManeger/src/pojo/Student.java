package pojo;

public class Student {
	private Long id;
	private String name;
	private String sex;
	private Integer age;
	private Integer classId;
	private String tel;
	private String password;

	public Student() {

	}

	public Student(Long id, String name, String sex, Integer age, Integer classId, String tel) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.classId = classId;
		this.tel = tel;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
