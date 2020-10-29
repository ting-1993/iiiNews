package CR.dao;

import java.util.List;

import CR.model.CRBean;
import iiiNews.MB.model.MBBean;

public interface CR_Dao {
	
	public List<CRBean> getRecord();

	public MBBean getMemberById(int memberId);

	void addReport(CRBean report);
	
	CRBean getReportById(int pk);
	
	void deleteReportByPk(int pk);
	
	void updateReport(CRBean cb);
}
