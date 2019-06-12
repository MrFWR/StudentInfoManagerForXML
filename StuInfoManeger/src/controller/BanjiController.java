package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.impl.BanjiDaoImpl;
import pojo.Banji;

@Controller
@RequestMapping("/banji")
public class BanjiController {
	@Autowired
	private BanjiDaoImpl bdi;

	@ResponseBody
	@RequestMapping("/all")
	public List<Banji> queryAll() {
		List<Banji> banjis = bdi.queryClass();
		return banjis;
	}

	@ResponseBody
	@RequestMapping("/one")
	public Banji queryById(@RequestBody Banji banji) {
		Banji banji2 = bdi.queryById(banji.getId());
		return banji2;
	}

	@RequestMapping("/to_banjiPage")
	public String to_banjiPage() {
		return "banji";
	}

	public BanjiDaoImpl getBdi() {
		return bdi;
	}

	public void setBdi(BanjiDaoImpl bdi) {
		this.bdi = bdi;
	}

	@RequestMapping("/add")
	public @ResponseBody String addBanji(@RequestBody Banji banji) {
		Banji b = bdi.queryById(banji.getId());
		if (b != null) {
			return "false";
		} else {
			bdi.addClass(banji);
			return "true";
		}
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "addBanji";
	}
}
