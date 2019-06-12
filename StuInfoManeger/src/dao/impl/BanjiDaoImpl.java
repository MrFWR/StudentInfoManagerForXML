package dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.BanjiDao;
import pojo.Banji;
import util.XMLOperator;

@Repository
public class BanjiDaoImpl implements BanjiDao {
	private final String path = "C:/FwrData/db/class.xml";
	private final String cname = "class";
	@Autowired
	private XMLOperator xMLOperator;

	@Override
	public List<Banji> queryClass() {
		// TODO Auto-generated method stub
		List<Element> elements = xMLOperator.queryAll(path, cname);
		List<Banji> banjis = new ArrayList<Banji>();
		for (Element element : elements) {
			Integer id = Integer.valueOf(element.getChildText("id"));
			String className = element.getChildText("className");
			String department = element.getChildText("department");
			Integer studentNumber = Integer.valueOf(element.getChildText("studentNumber"));
			Banji banji = new Banji(id, className, department, studentNumber);
			banjis.add(banji);
		}
		return banjis;
	}

	public XMLOperator getxMLOperator() {
		return xMLOperator;
	}

	public void setxMLOperator(XMLOperator xMLOperator) {
		this.xMLOperator = xMLOperator;
	}

	@Override
	public void addClass(Banji banji) {
		// TODO Auto-generated method stub
		Element e = new Element(cname);
		e.addContent(new Element("id").setText(banji.getId().toString()));
		e.addContent(new Element("className").setText(banji.getClassName()));
		e.addContent(new Element("department").setText(banji.getDepartment()));
		e.addContent(new Element("studentNumber").setText(banji.getStudentNumber().toString()));
		xMLOperator.add(path, e);
	}

	@Override
	public void updateClass(Banji banji) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("className", banji.getClassName());
		map.put("department", banji.getDepartment());
		map.put("studentNumber", banji.getStudentNumber().toString());
		xMLOperator.update(path, cname, map, banji.getId().toString());
	}

	@Override
	public void deleteClass(Integer id) {
		// TODO Auto-generated method stub
		xMLOperator.delete(path, cname, id.toString());
	}

	@Override
	public Banji queryById(Integer id) {
		// TODO Auto-generated method stub
		Element element = xMLOperator.queryById(path, cname, id.toString());
		if (element == null) {
			return null;
		}
		Banji banji = new Banji(Integer.valueOf(element.getChildText("id")), element.getChildText("className"),
				element.getChildText("department"), Integer.valueOf(element.getChildText("studentNumber")));
		return banji;
	}

}
