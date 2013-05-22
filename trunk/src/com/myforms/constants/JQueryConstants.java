package com.myforms.constants;

public interface JQueryConstants {
public String onChange = "\n$('#{0}').change(function () {" +
		" if({1}){" +
		"   {2}" +
		"    }" +
		"     });\n"; 
public String onBlur = "\n$('#{0}').blur(function () {\n" +
" if({1}){" +
"   {2}" +
"    }" +
"     });\n"; 
public String CHANGE_ATTR = "\n$('#{0}').css('{1}','{2}');\n";
public String DISPLAY = "display";
public String NONE = "NONE";
public String FLD_DIV_PREFIX = "div_";
public String REQ_DIV_PREFIX = "req_div_";
public String BORDER_WITDH = "border-width";
public String BORDER_COLOR = "border-color";
public String COLOR_RED = "red";
public String MAND_BORDER_WIDTH = "1px";
public String DEFAULT_BORDER_COLOR = "#E0EEE0";

}
