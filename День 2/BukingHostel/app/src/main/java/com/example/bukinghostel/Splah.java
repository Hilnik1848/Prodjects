package com.example.bukinghostel;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;
public class Splah extends AppCompatActivity {

        private static final int SPLASH_DELAY = 4000;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.splash_screen);

            new Handler().postDelayed(() -> {
                Intent intent = new Intent(Splah.this, MainActivity.class);
                startActivity(intent);
                finish();
            }, SPLASH_DELAY);
        }
    }

