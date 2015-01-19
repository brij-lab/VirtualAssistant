package edu.iiit.speech.healthcare;

@Deprecated
public class FacultyContextInfo {
	private String name;
	private String numberType;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumberType() {
		return numberType;
	}
	public void setNumberType(String numberType) {
		this.numberType = numberType;
	}
	
	public String toString() {
		return "{ name: " + name + ", numberType: " + numberType + " }";
	}
	
}
