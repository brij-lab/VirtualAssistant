package edu.iiit.speech.healthcare;

@Deprecated
public class FacultyDialogSlots {
	private String facultyID;
	private String infoID;
	/**
	 * @return the facultyID
	 */
	public String getFacultyID() {
		return facultyID;
	}
	/**
	 * @param facultyID the facultyID to set
	 */
	public void setFacultyID(String facultyID) {
		this.facultyID = facultyID;
	}
	/**
	 * @return the infoID
	 */
	public String getInfoID() {
		return infoID;
	}
	/**
	 * @param infoID the infoID to set
	 */
	public void setInfoID(String infoID) {
		this.infoID = infoID;
	}
	
	public Object getField(String fieldname) {
		Object value = null;
		if (fieldname.equalsIgnoreCase("facultyID")) {
			value = this.facultyID;
		}else if (fieldname.equalsIgnoreCase("infoID")) {
			value = this.infoID;
		}
		return value;
	}
}
