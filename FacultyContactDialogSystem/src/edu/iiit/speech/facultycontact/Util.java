package edu.iiit.speech.facultycontact;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;

public class Util {
	public void showMsg(Context app, String msg, String title) {
		// 1. Instantiate an AlertDialog.Builder with its constructor
		AlertDialog.Builder builder = new AlertDialog.Builder(app);

		// 2. Chain together various setter methods to set the dialog
		// characteristics
		builder.setMessage(msg).setTitle(title);
		builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int id) {
				// User clicked OK button
			}
		});

		// 3. Get the AlertDialog from create()
		AlertDialog dialog = builder.create();

		dialog.show();
	}
}
