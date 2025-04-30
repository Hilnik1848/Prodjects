package com.example.bukinghostel;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.fragment.app.Fragment;

public class OnboardingFragment extends Fragment {
    private static final String ARG_POSITION = "position";

    public static OnboardingFragment newInstance(int position) {
        OnboardingFragment fragment = new OnboardingFragment();
        Bundle args = new Bundle();
        args.putInt(ARG_POSITION, position);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_layout, container, false);
        int position = getArguments().getInt(ARG_POSITION);

        TextView title = view.findViewById(R.id.title);
        TextView description = view.findViewById(R.id.description);

        switch (position) {
            case 0:
                title.setText("Найди Свой Уголок");
                description.setText("Где бы вы ни мечтали оказаться, мы поможем вам найти идеальное место для отдыха.");
                break;
            case 1:
                title.setText("Бронируйте Легко, Путешествуйте Свободно");
                description.setText("Планируйте поездки без лишних усилий — мы сделаем все за вас.");
                break;
            case 2:
                title.setText("Позвольте Себе Расслабиться");
                description.setText("Мы позаботимся о вашем комфорте, чтобы вы могли наслаждаться каждым моментом отдыха.");
                break;
        }
        return view;
    }
}
