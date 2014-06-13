package edu.iiit.speech.facultycontact;

import java.util.Arrays;
import java.util.List;

public class NLUParser {

	private final static String SALUTATIONS = "mr|mrs|dr|mister|missus|doctor|sir|professor|prof";

	private final static String[] stopWords = { "me", "what", "give", "i",
			"of", "what's", "please", "number", "you", "can", "want", "the",
			"is", "sir's", "<s>", "</s>", "'s" };
	private final static List<String> STOP_WORDS = Arrays.asList(stopWords);

	private final static String[] numberTypes = { "phone", "office", "cell",
			"residential", "mobile", "extension", "residence", "home",
			"office extension", "residential extension" };
	private final static List<String> NUMBER_TYPES = Arrays.asList(numberTypes);

	public FacultyContextInfo getContextInfo(String str) {

		FacultyContextInfo contextInfo = new FacultyContextInfo();
		str = preProcess(str);

		if (str != null && str != "") {

			/* Getting number type out of string */
			String nType = null;
			for (String type : NUMBER_TYPES) {
				if (str.indexOf(type) != -1) {
					nType = type;
				}
			}
			contextInfo.setNumberType(nType);
			if (nType != null) {

				String name = str.replaceAll(nType, "").trim();
				if (name != null && name != "") {
					contextInfo.setName(name);
				} else {
					contextInfo.setName(null);
				}

			} else {
				contextInfo.setName(str);
			}

		} else {
			contextInfo.setName(null);
			contextInfo.setNumberType(null);
		}

		return contextInfo;
	}

	private String preProcess(String str) {
		String pStr = str.replaceAll("[^a-zA-Z' ]", "");
		pStr = pStr.replaceAll(SALUTATIONS, "");
		pStr = pStr.replaceAll("'s", "");
		String[] sp = pStr.split(" ");
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < sp.length; i++) {
			String word = sp[i].trim();
			if (word != null && word != "" && !STOP_WORDS.contains(word)
					&& word.length() > 2) {
				sb.append(word).append(" ");
			}
		}
		return sb.toString().trim();
	}

	public static void main(String[] args) {
		NLUParser parser = new NLUParser();
		System.out.println(parser.getContextInfo("my name is brij"));
	}
}
