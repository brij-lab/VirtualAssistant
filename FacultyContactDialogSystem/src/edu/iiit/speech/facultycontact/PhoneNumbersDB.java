package edu.iiit.speech.facultycontact;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import android.content.res.AssetManager;
import android.content.res.Resources;

@Deprecated
public class PhoneNumbersDB {
	private Properties phoneNumProps = null;

	/**
	 * Constructor to initialize properties
	 * @param app - PocketSphinxDemo
	 */
	public PhoneNumbersDB(FacultyContactActivity app) {
		if (phoneNumProps == null) {
			try {
				Resources resources = app.getResources();
				AssetManager assetManager = resources.getAssets();
				InputStream inputStream = assetManager
						.open("phonenumbers.properties");
				phoneNumProps = new Properties();
				phoneNumProps.load(inputStream);
				inputStream.close();
			} catch (IOException e) {
				System.err.println("Failed to load phone numbers!");
				e.printStackTrace();
			}

		}
	}

	/**
	 * Gets phone number of required entity
	 * @param property
	 * @return
	 */
	public String getData(String property) {
		String phNum = phoneNumProps.getProperty(property);
		return phNum == null ? "Not found" : phNum;
	}
}
