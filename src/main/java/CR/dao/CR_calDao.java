package CR.dao;

import java.util.Map;

public interface CR_calDao {

	
	Map<String, Long> calFromCate();
	Map<String, Integer> calunFromEmp();
	Map<String, Long> calAllFromEmp();
	Map<String, Integer> calDoneFromEmp();
}
