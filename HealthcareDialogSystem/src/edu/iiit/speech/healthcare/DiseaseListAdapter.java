package edu.iiit.speech.healthcare;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class DiseaseListAdapter extends BaseAdapter {

	private final ArrayList mData;

	public DiseaseListAdapter(List<ProbableDisease> diseases) {
		mData = new ArrayList();
		mData.addAll(diseases);
	}

	@Override
	public int getCount() {
		return mData.size();
	}

	@Override
	public Object getItem(int position) {
		return mData.get(position);
	}

	@Override
	public long getItemId(int arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		final View result;

		if (convertView == null) {
			result = LayoutInflater.from(parent.getContext()).inflate(
					R.layout.diseaselist, parent, false);
		} else {
			result = convertView;
		}

		ProbableDisease item = (ProbableDisease) getItem(position);

		// TODO replace findViewById by ViewHolder
		((TextView) result.findViewById(R.id.name)).setText(item
				.getName());
		((TextView) result.findViewById(R.id.ratio)).setText(item
				.getRatio());
		((TextView) result.findViewById(R.id.symptoms)).setText(item
				.getMatchingSymptoms());

		return result;
	}

}
