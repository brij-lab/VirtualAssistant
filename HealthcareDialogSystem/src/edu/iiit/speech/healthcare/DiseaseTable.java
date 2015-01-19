package edu.iiit.speech.healthcare;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class DiseaseTable {
	Map<String, Map<String, Boolean>> diseaseMatrix;
	Map<String, Boolean> symptomsMap;

	public DiseaseTable(File diseaseFile) {
		diseaseMatrix = new HashMap<String, Map<String, Boolean>>();
		symptomsMap = new HashMap<String, Boolean>();
		String line;
		try {
			BufferedReader br = new BufferedReader(new FileReader(diseaseFile));
			while ((line = br.readLine()) != null) {
				// Get disease name
				String[] dsplit = line.split(":");

				String dname = dsplit[0].trim();

				String[] symptoms = dsplit[1].split(",");
				int nsymp = symptoms.length;
				Map<String, Boolean> sympMap = new HashMap<String, Boolean>();
				for (int i = 0; i < nsymp; i++) {
					sympMap.put(symptoms[i].toLowerCase().trim(), false);
				}
				diseaseMatrix.put(dname, sympMap);
				symptomsMap.putAll(sympMap);
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void reset() {
		// Make all the flags as false
		for (Entry<String, Map<String, Boolean>> entry : diseaseMatrix
				.entrySet()) {
			Map<String, Boolean> symptoms = entry.getValue();
			for (Entry<String, Boolean> sentry : symptoms.entrySet()) {
				sentry.setValue(false);
			}
		}
		for (Entry<String, Boolean> entry: symptomsMap.entrySet()) {
			entry.setValue(false);
		}
	}

	public void raiseFlags(String givenSymptoms) {
		// Loop thru all diseases and raise flags for the ones that match
		for (Entry<String, Map<String, Boolean>> entry : diseaseMatrix
				.entrySet()) {
			Map<String, Boolean> symptoms = entry.getValue();
			for (Entry<String, Boolean> sentry : symptoms.entrySet()) {
				if (givenSymptoms.contains(sentry.getKey())) {
					sentry.setValue(true);
				}
			}
		}
		// Set global symptoms also true
		for (Entry<String, Boolean> entry: symptomsMap.entrySet()) {
			if (givenSymptoms.contains(entry.getKey())){
				entry.setValue(true);
			}
		}
	}

	public List<ProbableDisease> getProbableDiseases() {
		List<ProbableDisease> probDiseases = new ArrayList<ProbableDisease>();
		StringBuilder matchingSymp;
		StringBuilder remainingSymp;
		Map<String, Boolean> symptoms;
		List<String> accumulatedSymptoms = getTrueSymptoms();
		int accSympCount = accumulatedSymptoms.size();
		// Loop thru all diseases and find diseases which have one or more
		// raised flags
		for (Entry<String, Map<String, Boolean>> entry : diseaseMatrix
				.entrySet()) {
			symptoms = entry.getValue();
			int total = symptoms.size();
			// Only take those disease into account who have more or equal
			// symptoms to what we are looking for.
			// Reject the disease if any of its symptom is not
			// present in the symptoms provided by user
			if (total >= accSympCount
					&& symptoms.keySet().containsAll(accumulatedSymptoms)) {
				int count = 0, remCount = 0;
				matchingSymp = new StringBuilder();
				remainingSymp = new StringBuilder();

				for (Entry<String, Boolean> sentry : symptoms.entrySet()) {
					if (sentry.getValue()) {
						matchingSymp.append(sentry.getKey()).append(", ");
						count++;
					} else {
						remainingSymp.append(sentry.getKey()).append(", ");
						remCount++;
					}
				}

				if (count > 0) {

					String matchingStr = matchingSymp.toString();
					matchingStr = matchingStr.replaceAll(", $", "");
					String remainingStr = remainingSymp.toString();
					remainingStr = remainingStr.replaceAll(", $", "");

					probDiseases.add(new ProbableDisease(entry.getKey(), count
							+ "/" + total, matchingStr, remainingStr, (remCount == 0)));
				}
			}
		}
		return probDiseases;
	}
	
	private List<String> getTrueSymptoms() {
		List<String> trueSymp = new ArrayList<String>();
		for (Entry<String, Boolean> entry: symptomsMap.entrySet()) {
			if (entry.getValue()){
				trueSymp.add(entry.getKey());
			}
		}
		return trueSymp;
	}
}
