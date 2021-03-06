package edu.iiit.speech.healthcare;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQueryBuilder;

import com.readystatesoftware.sqliteasset.SQLiteAssetHelper;

@Deprecated
public class FacultyDatabase extends SQLiteAssetHelper {

	private static final String DATABASE_NAME = "faculty20140613.sqlite";
	private static final int DATABASE_VERSION = 3;
	private static final String TABLE_FACULTY_INFO = "faculty_info";
	private static final String TABLE_FACULTY_NAMES = "faculty_names";
	private static final String TABLE_INFO_TYPE = "info_type";
	private static final String TABLE_SYNONYMS = "synonyms";

	public FacultyDatabase(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
		// TODO Auto-generated constructor stub
	}

	public Cursor getSynonyms() {

		SQLiteDatabase db = getReadableDatabase();
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();

		String[] sqlSelect = { "syn" };
		String sqlTables = "synonyms";

		qb.setTables(sqlTables);
		Cursor c = qb.query(db, sqlSelect, null, null, null, null, null);

		// c.moveToFirst();
		return c;

	}

	public FacultyVerifiedInfo verifyFacultyInfo(
			FacultyContextInfo facultyContextInfo) {

		FacultyVerifiedInfo verifiedInfo = new FacultyVerifiedInfo();
		// Get faculty id by synonym provided by ASR hypothesis
		String fac_id = null;
		String fac_name = facultyContextInfo.getName();
		if (fac_name != null && !"".equals(fac_name.trim())) {
			fac_id = getFacultyIdByName(fac_name.trim());
		}
		// Get information type id by info type name provided by ASR hypothesis
		String info_type_id = null;
		String info_type_name = facultyContextInfo.getNumberType();
		if (info_type_name != null && !"".equals(info_type_name.trim())) {
			info_type_id = getInfoTypeIdByName(info_type_name.trim());
		}
		verifiedInfo.setFacultyID(fac_id);
		verifiedInfo.setInfoTypeID(info_type_id);
		return verifiedInfo;
	}

	public String getFacultyInfo(String fac_id, String info_type_id) {

		String info = "Not Found!";
		if (fac_id != null && info_type_id != null) {
			SQLiteDatabase db = getReadableDatabase();
			SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
			qb.setTables(TABLE_FACULTY_INFO);
			String[] sqlSelect = { "info" };
			Cursor c1 = qb.query(db, sqlSelect, "faculty_id=" + fac_id
					+ " and type=" + info_type_id, null, null, null, null);
			if (c1.moveToFirst()) {
				info = c1.getString(0);
			} else {
				boolean not_found = true;
				int info_id = 1;
				while (not_found && info_id < 6) {
					c1 = qb.query(db, sqlSelect, "faculty_id=" + fac_id
							+ " and type=" + info_id, null, null, null,
							null);
					if (c1.moveToFirst()) {
						info = c1.getString(0);
						not_found = false;
					}
					else{
						info_id++;
					}
				}
			}
		}
		return info;
	}

	public String getFacultyIdByName(String name) {
		String fac_id = null;
		SQLiteDatabase db = getReadableDatabase();
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		qb.setTables(TABLE_SYNONYMS);
		String[] sqlSelect = { "faculty_id" };
		Cursor c1 = qb.query(db, sqlSelect, "syn='" + name + "'", null, null,
				null, null);
		if (c1.moveToFirst()) {
			fac_id = c1.getString(0);
		}
		return fac_id;
	}

	public String getFacultyNameById(String id) {
		String fac_name = null;
		SQLiteDatabase db = getReadableDatabase();
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		qb.setTables(TABLE_FACULTY_NAMES);
		String[] sqlSelect = { "name" };
		Cursor c1 = qb.query(db, sqlSelect, "id=" + id, null, null, null, null);
		if (c1.moveToFirst()) {
			fac_name = c1.getString(0);
		}
		return fac_name;
	}

	public String getInfoTypeIdByName(String name) {
		String info_type_id = null;
		SQLiteDatabase db = getReadableDatabase();
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		qb.setTables(TABLE_INFO_TYPE);
		String[] sqlSelect = { "info_type_id" };
		Cursor c1 = qb.query(db, sqlSelect, "value='" + name + "'", null, null,
				null, null);
		if (c1.moveToFirst()) {
			info_type_id = c1.getString(0);
		}
		return info_type_id;
	}

	public String getInfoTypeNameByID(String id) {
		String info_type_name = null;
		SQLiteDatabase db = getReadableDatabase();
		SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
		qb.setTables(TABLE_INFO_TYPE);
		String[] sqlSelect = { "value" };
		Cursor c1 = qb.query(db, sqlSelect, "info_type_id=" + id, null, null,
				null, null);
		if (c1.moveToFirst()) {
			info_type_name = c1.getString(0);
		}
		return info_type_name;
	}

}
