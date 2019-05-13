package com.example.enjoycar_agent_flutter;

import android.app.AlertDialog;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/plugin";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("print")) {
                    final String message = methodCall.argument("message");
                    new AlertDialog.Builder(MainActivity.this)
                            .setTitle(message)
                    .create().show();
                } else if (methodCall.method.equals("obtainInfo")) {
                    result.success("this is  android system send a message");
                } else {
                    result.notImplemented();
                }
            }
        });
    }
}
