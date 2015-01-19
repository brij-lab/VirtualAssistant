package edu.iiit.speech.healthcare;

import java.io.File;
import java.util.List;

import android.content.Context;
import android.os.Environment;
import android.text.Html;
import android.text.Spanned;

/**
 * This class will manage the dialogs in the sense 1. Ensure completeness of
 * information 2. Ensures disambiguity in information 3. Maintain & record the
 * state of dialog
 * 
 * @author brij
 * 
 */
public class DialogManager {

	private DiseaseTable diseaseTable;
	private HealthcareActivity app;
	private List<ProbableDisease> probableDiseases;
	private boolean initDiscourse;
	private boolean expect_any_more_no;
	private ProbableDisease exactDisease;
	private int discourseIndex;

	private Util util;
	private static final String POPUP_TITLE = "";
	private static final String[] AFFIRMATIVE = { "yes", "ya" };
	private static final String[] NEGATIVE = { "no", "nope" };

	public DialogManager(Context context) {
		app = (HealthcareActivity) context;
		util = new Util();
	}

	public boolean init(String facultyContext) {

		// Initialize or reset the disease data structure
		if (diseaseTable == null) {
			File dir = Environment.getExternalStorageDirectory();
			File diseaseFile = new File(dir,
					"edu.cmu.pocketsphinx/healthcare/symptoms_matrix");
			diseaseTable = new DiseaseTable(diseaseFile);
		} else {
			diseaseTable.reset();
		}

		initDiscourse = false;
		discourseIndex = -1;
		expect_any_more_no = false;
		exactDisease = null;

		// Start the management
		boolean complete = manage(facultyContext);
		if (!complete) {
			// app.disease_list
			// .setText(app.getString(R.string.info_insufficient));
		}
		return complete;
	}

	public boolean manage(String facultyContext) {
		boolean info_complete = false;

		if (!initDiscourse) {
			diseaseTable.raiseFlags(facultyContext);
			probableDiseases = diseaseTable.getProbableDiseases();

			showResults();

			int pDiseaseCount = probableDiseases.size();
			// Condition for Termination
			if (pDiseaseCount == 0) {
				// Sorry no disease matched
				info_complete = true;
				app.speakOut(app.getString(R.string.no_diagnosis));
			} else if (pDiseaseCount == 1) {
				// Diagnosis complete
				info_complete = true;
				appendDialogText(app.getString(R.string.diagnosis_complete) + " "
						+ probableDiseases.get(0).getName(), "S");
			} else if (pDiseaseCount > 1) {

				if (expect_any_more_no
						&& facultyContext != null
						&& Util.stringContainsItemFromList(facultyContext,
								NEGATIVE)) {
					// Pronounce exact symptom disease as the verdict
					info_complete = true;
					appendDialogText(app.getString(R.string.diagnosis_complete)
							+ " " + exactDisease.getName(), "S");
					probableDiseases.clear();
					probableDiseases.add(exactDisease);
				} else {
					// Check if any disease has exactly that many symptoms
					for (ProbableDisease disease : probableDiseases) {
						if (disease.isExact()) {
							exactDisease = disease;
							break;
						}
					}

					if (exactDisease != null) {
						app.speakOut(app.getString(R.string.any_more));
						expect_any_more_no = true;
					} else {
						// Ask for possible symptoms and iterate
						app.speakOut(app.getString(R.string.partial_diagnosis));
						initDiscourse = true;
						manageDiscourse(null);
					}
				}
			}
		} else {
			// iterate over probable diseases and ask for possible clues
			info_complete = manageDiscourse(facultyContext);
			if (info_complete) {
				initDiscourse = false;

				// Disease found
				if (discourseIndex < probableDiseases.size()) {
					appendDialogText(app.getString(R.string.diagnosis_complete)
							+ " "
							+ probableDiseases.get(discourseIndex).getName(), "S");

					// remove all elements from probable diseases except the
					// chosen one
					ProbableDisease temp = probableDiseases.get(discourseIndex);
					probableDiseases.clear();
					probableDiseases.add(temp);
				} else {
					// Disease not found
					app.speakOut(app.getString(R.string.no_diagnosis));
					probableDiseases.clear();
				}

			}
		}

		// return the value that signifies whether dialog has ended or not
		return info_complete;
	}

	public boolean manageDiscourse(String contextInfo) {
		boolean info_complete = false;

		if (contextInfo != null
				&& Util.stringContainsItemFromList(contextInfo, AFFIRMATIVE)) {
			info_complete = true;
		} else {
			discourseIndex++;
			if (discourseIndex < probableDiseases.size()) {
				appendDialogText(
						app.getString(R.string.discourse_yes)
								+ ": "
								+ probableDiseases.get(discourseIndex)
										.getRemainingSymptoms()
								+ app.getString(R.string.discourse_no), "S");
			} else {
				info_complete = true;
			}
		}

		return info_complete;
	}

	private void appendDialogText(String text, String tag) {
		app.edit_text.setText(app.edit_text.getText()
				+ getFormattedText(text, tag).toString() + "\n");
		app.speakOut(text);
	}

	private Spanned getFormattedText(String text, String tag) {
		Spanned ftext = null;
		if ("S".equals(tag)) {
			ftext = Html.fromHtml("<font color='red'><b>" + tag + ": </b>"
					+ text + "</font>");
		} else {
			ftext = Html.fromHtml("<font color='green'><b>" + tag + ": </b>"
					+ text + "</font>");
		}
		System.out.println("text -------- > " + ftext);
		return ftext;
	}

	public void showResults() {
		DiseaseListAdapter diseaseListAdapter = new DiseaseListAdapter(
				probableDiseases);
		app.disease_list.setAdapter(diseaseListAdapter);
	}

	public void resetResults() {
		app.disease_list.setAdapter(null);
	}
}
