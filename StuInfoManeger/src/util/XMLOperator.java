package util;

import java.io.FileWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.springframework.stereotype.Component;

@Component
public class XMLOperator {
	Document doc = null;
	SAXBuilder saxBuilder = new SAXBuilder();

	public void add(String path, Element element) {
		try {
			doc = saxBuilder.build(path);
			Element root = doc.getRootElement();
			if (element != null) {
				root.addContent(element);
				saveXML(path, doc);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delete(String path, String cname, String id) {
		try {
			doc = saxBuilder.build(path);
			Element root = doc.getRootElement();
			List<Element> elements = root.getChildren(cname);
			for (Element element : elements) {
				if (element.getChildText("id").equals(id)) {
					root.removeContent(element);
					saveXML(path, doc);
					return;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void update(String path, String cname, Map<String, String> map, String id) {
		try {
			doc = saxBuilder.build(path);
			Element root = doc.getRootElement();
			List<Element> elements = root.getChildren(cname);
			for (Element element : elements) {
				if (element.getChildText("id").equals(id)) {
					Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator();
					while (entries.hasNext()) {
						Map.Entry<String, String> entry = entries.next();
						Element e = element.getChild(entry.getKey());
						e.setText(entry.getValue());
					}
					saveXML(path, doc);
					return;
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Element> queryAll(String path, String cname) {
		List<Element> elements = null;
		try {
			doc = saxBuilder.build(path);
			Element root = doc.getRootElement();
			elements = root.getChildren(cname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return elements;
	}

	public Element queryById(String path, String cname, String id) {
		Element element = null;
		try {
			doc = saxBuilder.build(path);
			Element root = doc.getRootElement();
			List<Element> elements = root.getChildren(cname);
			for (Element e : elements) {
				if (e.getChildText("id").equals(id)) {
					element = e;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return element;
	}

	public void saveXML(String path, Document doc) {
		FileWriter writer = null;
		try {
			XMLOutputter outputter = new XMLOutputter();
			writer = new FileWriter(path);
			Format format = Format.getPrettyFormat();
			format.setEncoding("utf-8");
			outputter.setFormat(format);
			outputter.output(doc, writer);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (writer != null) {
					writer.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}

		}
	}
}
