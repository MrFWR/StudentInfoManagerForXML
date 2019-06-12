package pojo;

public class User {
	private Long id;
	private String password;
	private Integer role;

	public User() {
	}

	public User(Long id, String password, Integer role) {
		this.id = id;
		this.password = password;
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}
}
