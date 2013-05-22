package com.myforms.template.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.dao.DaoUtil;
import com.myforms.field.config.model.TemplateField;
import com.myforms.template.config.model.Template;
import com.myforms.util.MyFormProperties;

public class SaveUpdateTemplateDaoIBatis  extends SqlMapClientDaoSupport implements SaveUpdateTemplateDao {
	private KeyGenerator keyGenerator;
	public void saveTemplate(Template template) {
		getSqlMapClientTemplate().insert(MyFormsConstants.Queries.SAVE_TEMPLATE, template);
		List<QueryBatch> queries =  new ArrayList<QueryBatch>();
		prepareClientTemplate(template,queries);
		prepareTemplateFields(template, queries);
		DaoUtil.executeBatch(queries, getSqlMapClientTemplate());
	}



	public void updateTemplate(Template template) {
		// TODO Auto-generated method stub

	}
	

	private void prepareClientTemplate(Template template, List<QueryBatch> queries) {
		Map<String, String> map = new HashMap<String, String>();
		map.put(MyFormsConstants.ParamsName.TEMPLATE_ID, template.getTemplateId().toString());
		map.put(MyFormsConstants.ParamsName.CLNT_ID, MyFormProperties.getInstance().getCurrentUser().getClient().getClientId().toString());
		map.put(MyFormsConstants.ParamsName.CLNT_TMPL_ID, keyGenerator.generateKey(MyFormsConstants.Tables.CLNT_TMPL).toString());
		QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.SAVE_CLNT_TMPL,map);
		queries.add(batch);
	}
	
	private void prepareTemplateFields(Template template, List<QueryBatch> queries) {
		for(TemplateField field : template.getTemplateFieldMap().values()){
			queries.add(new QueryBatch(MyFormsConstants.Queries.SAVE_TEMPLATE_FLD,field));
		}
		
	}
	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}

}
