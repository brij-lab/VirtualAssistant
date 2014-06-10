package edu.iiit.speech.facultycontact;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class NLUParser {

	private final static String SALUTATIONS = " mr | mrs | dr | mister | missus | doctor | sir | professor | prof ";

	private final static String[] stopWords = { "is", "what's", "of", "me" };
	private final static List<String> STOP_WORDS = Arrays.asList(stopWords);

	private final static String[] numberTypes = { "phone", "office",
			"residential", "mobile", "extension", "residential extension" };
	private final static List<String> NUMBER_TYPES = Arrays.asList(numberTypes);

	public FacultyContextInfo getContextInfo(String str) {

		FacultyContextInfo contextInfo = new FacultyContextInfo();

		System.out.println("Question: " + str);

		String fstr = preProcess(str);

		/* Getting name out of the string */

		int of_index = fstr.indexOf(" of ");
		int apos_index = fstr.lastIndexOf("'s ");

		if (of_index != -1) {

			fstr = fstr.substring(of_index + 4);

		} else if (apos_index != -1) {

			/* Keep going till you find a stop word - this will get the name */

			int bt_index = apos_index - 1;
			int start_index = 0;
			String ext_word = null;
			List<String> nameList = new ArrayList<String>();
			StringBuilder nameSB = new StringBuilder();
			while (true) {

				if (bt_index <= 0)
					break;

				start_index = bt_index;
				while (bt_index >= 0 && fstr.charAt(bt_index) != ' ') {
					bt_index--;
				}
				ext_word = fstr.substring(bt_index + 1, start_index + 1);
				bt_index--;
				if (!STOP_WORDS.contains(ext_word)) {

					nameList.add(ext_word);

				} else
					break;

			}

			Collections.reverse(nameList);
			for (String name : nameList) {
				nameSB.append(name).append(" ");
			}

			fstr = nameSB.toString().trim();

		} else {

			// Do nothing

		}

		contextInfo.setName(fstr);

		/* Getting number type out of string */
		String nType = null;
		for (String type : NUMBER_TYPES) {
			if (str.indexOf(" " + type + " ") != -1) {
				nType = type;
			}
		}
		contextInfo.setNumberType(nType);

		return contextInfo;
	}

	private String preProcess(String str) {
		String pStr = str.replaceAll("[^a-zA-Z' ]", "");
		pStr = pStr.replaceAll(SALUTATIONS, "");
		return pStr;
	}

	public static void main(String[] args) {
		NLUParser parser = new NLUParser();
		System.out.println(parser.getContextInfo("my name is brij"));
	}
}
