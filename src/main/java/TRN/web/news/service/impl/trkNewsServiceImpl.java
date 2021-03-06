package TRN.web.news.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import TRN.web.news.dao.trkNewsDao;
import TRN.web.news.model.rptNewsBean;
import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;

@Service
public class trkNewsServiceImpl implements trkNewsService {
	trkNewsDao dao;
	
	@Autowired
    public void setDao(trkNewsDao dao) {
		this.dao = dao;
	}
	
	@Transactional 
	@Override                       
	public List<trkNewsBean> getAllProducts() {     //查詢所有資料
		return dao.getAllProducts();
	}

	@Transactional
	@Override               //點按鈕直接更新數量
	public void updateNews(Integer trackId, Integer clicnum) {
		dao.updateNews(trackId, clicnum);;
	}
	@Transactional
	@Override                     //分類查詢 show有哪些分類
	public List<String> getAlltypes() {
		return dao.getAlltypes();
	}
	@Transactional
	@Override                //分類查詢 show 單個分類所有新聞   
	public List<trkNewsBean> getNewsBytypes(String type) {
		return dao.getNewsBytypes(type);
	}
	@Transactional
	@Override                  //查詢單筆產品資料
	public trkNewsBean getNewsById(int NewsId) {
		return dao.getNewsById(NewsId);
	}
	@Transactional
	@Override
	public void addtrkNews(trkNewsBean trkNew) {
		dao.addtrkNews(trkNew);
		
	}
	@Transactional
	@Override
	public rptNewsBean getReportById(int reportId) {
		return dao.getReportById(reportId);
	}
	@Transactional
	@Override
	public List<rptNewsBean> getReportList() {
		return dao.getReportList();
	}
	@Transactional  
	@Override
	public void deletetrkNewsByPK(Integer trackId) {
		dao.deletetrkNewsByPK(trackId);
	}
	@Transactional
	@Override
	public void updatetrkNews(trkNewsBean trkNew) {
		dao.updatetrkNews(trkNew);
		
	}
	@Transactional
	@Override
	public void evicttrkNews(trkNewsBean trkNew) {
		dao.evicttrkNews(trkNew);
		
	}
	@Transactional
	@Override
	public trkNewsBean findByPrimaryKey(Integer NewsId) {
		return dao.findByPrimaryKey(NewsId);
	}

}
