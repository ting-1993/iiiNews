package iiiNews.MB.service;

import java.util.List;

//import com.web.store.model.BookBean;

import iiiNews.MB.model.MBBean;

public interface MBService {

	public int saveMBService(MBBean MB);
	public MBBean getLastRecord();
	public List<MBBean> getAllMember();
	public MBBean getSingleMember(String memberId);
	public List<MBBean> getMember(String name);	
	void  addMember(MBBean member);
}