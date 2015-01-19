package edu.iiit.speech.healthcare;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import android.os.Environment;

public class NLUParser {

	private final static String SALUTATIONS = "mr|mrs|dr|mister|missus|doctor|sir|professor|prof";

	private final static String[] stopWords = { "me", "what", "give", "i",
			"what's", "please", "number", "you", "can", "want", "the",
			"is", "sir's", "<s>", "</s>", "'s", "a", "thanks", "thank", "ko",
			"call", "karo", "lagao", "kijiye", "kariye", "ke", "par", "pe",
			"batao", "show" };
	private final static List<String> STOP_WORDS = Arrays.asList(stopWords);

	private final static String[] numberTypes = { "phone", "office", "cell",
			"residential", "mobile", "extension", "residence", "home",
			"office extension", "residential extension" };
	private final static List<String> NUMBER_TYPES = Arrays.asList(numberTypes);
	
	private Map<String, String> symptom_syn;
	
	public NLUParser() {
		// Create synonym map
		symptom_syn = new HashMap<String, String>();
		File dir = Environment.getExternalStorageDirectory();
		File symSynFile = new File(dir,
				"edu.cmu.pocketsphinx/healthcare/symptoms_synonym");
		String line;
		try {
			BufferedReader br = new BufferedReader(new FileReader(symSynFile));
			String[] lineSp, symsyns;
			String symname;
			int synlen, i;
			while ((line = br.readLine()) != null) {
				lineSp = line.split(":");
				symname = lineSp[0].trim();
				symsyns = lineSp[1].split(",");
				synlen = symsyns.length;
				for (i = 0; i < synlen; i++) {
					symptom_syn.put(symsyns[i].trim(), symname);
				}
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getContextInfo(String str) {

		String contextInfo = null;
		str = preProcess(str);
		contextInfo = str.replaceAll("_", " ");

		/*if (str != null && str != "") {
			String[] split = str.split(" ");
			contextInfo = Arrays.asList(split);
		}*/
		
		for (Entry<String, String> symp: symptom_syn.entrySet()) {
			if (contextInfo.contains(symp.getKey())) {
				System.out.println("found in string :" + symp.getKey());
				contextInfo = contextInfo.replaceAll(symp.getKey(), symp.getValue());
			}
		}
		
		System.out.println("GOT STRING ======= "+ contextInfo);
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
			if (word != null && word != "" && !STOP_WORDS.contains(word)) {
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
