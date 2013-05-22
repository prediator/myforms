package org.myform.fcondition.process;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.myform.fcondition.domain.ConditionConfig;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.web.conditions.ProcessConditions;
import com.myforms.web.conditions.ProcessConditionsForRequired;
import com.myforms.web.conditions.ProcessConditionsForVisibilty;
import com.myforms.web.model.Document;

public class ConditionUtil {
	public static Map<String, ProcessConditions> processConditionFactory;
	static{
		processConditionFactory = new HashMap<String, ProcessConditions>();
		processConditionFactory.put(MyFormsConstants.ConditionType.VISIBILTY, new ProcessConditionsForVisibilty());
		processConditionFactory.put(MyFormsConstants.ConditionType.REQUIRED, new ProcessConditionsForRequired());
		
	}
	public static void processConditions(Document document){
		Map<String, Field> vfields = getFieldForCondition(MyFormsConstants.ConditionType.VISIBILTY, document);
		Map<String, Field> rfields = getFieldForCondition(MyFormsConstants.ConditionType.REQUIRED, document);
		processConditionFactory.get(MyFormsConstants.ConditionType.VISIBILTY).processConditions(vfields, document);
		processConditionFactory.get(MyFormsConstants.ConditionType.REQUIRED).processConditions(rfields, document);
	}
	private static Map<String, Field> getFieldForCondition(String visibilty, Document document) {
		Iterator<String> iter = document.getFieldMap().keySet().iterator();
		Map<String, Field> map = new HashMap<String, Field>();
		while(iter.hasNext()){
			String key = iter.next();
			Field field = document.getFieldMap().get(key);
			List<ConditionConfig> condsByTarget =  field.getTemplateField().getConditionsByTarget();
			for(ConditionConfig cc : condsByTarget){
				if(visibilty.equalsIgnoreCase(cc.getConditionType())){
					map.put(key, field);
				}
			}
		}
		return map;
	}
	
}
