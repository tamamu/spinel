package org.spinel.android;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.LinearLayoutCompat;

import android.app.ActionBar;
import android.os.Bundle;
import android.widget.TextView;

import org.spinel.glue.SpinelGlue;

public class MainActivity extends AppCompatActivity {

    static {
        System.loadLibrary("spinelandroid");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        SpinelGlue g = new SpinelGlue();
        String r = g.doInitialize();
        ((TextView)findViewById(R.id.text)).setText(r);
    }
}
