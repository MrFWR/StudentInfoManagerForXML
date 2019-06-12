package dao;

import java.util.List;

import pojo.Banji;

public interface BanjiDao {
	public List<Banji> queryClass();
	public void addClass(Banji banji);
	public void updateClass(Banji banji);
	public void deleteClass(Integer id);
	public Banji queryById(Integer id);
}
