package CR.service;

import java.util.List;

import CR.model.CRBean;
import iiiNews.MB.model.MBBean;

public interface CR_service {
	public List<CRBean> getRecord();
	

	void addReport(CRBean report);
	
	void deleteReprotByPk(Integer pk);
	public CRBean getReportById(int pk);
	void updateReport(CRBean cb);
	void evictReport(CRBean cb);

	public MBBean getMemberById(int memberId);
}
