package edu.iiit.speech.healthcare;

public class ProbableDisease {

	private String name;
	private String ratio;
	private String matchingSymptoms;
	private String remainingSymptoms;
	private Boolean exact;
	
	public ProbableDisease(String n, String r, String m, String re, Boolean ex) {
		name = n;
		ratio = r;
		matchingSymptoms = m;
		remainingSymptoms = re;
		exact = ex;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRatio() {
		return ratio;
	}
	public void setRatio(String ratio) {
		this.ratio = ratio;
	}
	public String getMatchingSymptoms() {
		return matchingSymptoms;
	}
	public void setMatchingSymptoms(String matchingSymptoms) {
		this.matchingSymptoms = matchingSymptoms;
	}
	public String getRemainingSymptoms() {
		return remainingSymptoms;
	}
	public void setRemainingSymptoms(String remainingSymptoms) {
		this.remainingSymptoms = remainingSymptoms;
	}

	public Boolean isExact() {
		return exact;
	}

	public void setExact(Boolean exact) {
		this.exact = exact;
	}
}
