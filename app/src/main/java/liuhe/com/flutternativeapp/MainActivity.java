package liuhe.com.flutternativeapp;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;

import io.flutter.app.FlutterActivity;
//import io.flutter.facade.Flutter;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterMain;

public class MainActivity extends FlutterActivity {

    //跳转该页面的时候可以传要跳转的页面,参数名固定为route
    private static final String ROUTE_PAGE = "route";
    public static Intent makeIntent(Context context, String routePage) {
        if (routePage == null || routePage.equals("")) {
            routePage = "/";
        }
        Intent intent = new Intent(context, MainActivity.class);
        intent.setAction(Intent.ACTION_RUN);
        intent.putExtra(ROUTE_PAGE, routePage);
        return intent;
    }

    public void onCreate(@Nullable Bundle savedInstanceState) {
        //或者在这里初始化Flutter
        FlutterMain.startInitialization(this);
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }


/*
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
        View flutterView = Flutter.createView(
                MainActivity.this,
                getLifecycle(),
                "route1"
        );
        setContentView(flutterView);
//        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(600, 800);
//        layout.leftMargin = 100;
//        layout.topMargin = 200;
//        addContentView(flutterView, layout);
    }*/
}
