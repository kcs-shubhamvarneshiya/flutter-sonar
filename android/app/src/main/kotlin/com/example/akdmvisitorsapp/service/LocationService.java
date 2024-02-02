package com.example.akdmvisitorsapp.service;

import android.Manifest;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.IBinder;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.WindowManager;
import android.widget.ImageView;
import androidx.annotation.Nullable;
import androidx.core.app.ActivityCompat;
import androidx.core.app.NotificationCompat;
import com.example.akdmvisitorsapp.MainActivity;
import com.example.akdmvisitorsapp.R;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.Priority;
import jp.co.recruit_lifestyle.android.floatingview.FloatingViewListener;
import jp.co.recruit_lifestyle.android.floatingview.FloatingViewManager;

public class LocationService extends Service implements FloatingViewListener{
    private static final int NOTIFICATION_ID = 1;
    String ACTION_STOP_SERVICE= "STOP";
    private FusedLocationProviderClient fusedLocationClient;
    private LocationCallback locationCallback;
    FusedLocationProviderClient fusedLocationProviderClient;
    LocationRequest mLocationRequest;
    private long UPDATE_INTERVAL = 10 * 1000;
    private long FASTEST_INTERVAL = 2000;
    private static final String TAG = "ChatHeadService";
    private FloatingViewManager mFloatingViewManager;

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        super.onStartCommand(intent, flags, startId);
        if (intent != null && this.ACTION_STOP_SERVICE.equals(intent.getAction())){
            stopSelf();
            stopForeground(true);
            return START_NOT_STICKY;
        }
        if (mFloatingViewManager != null) {
            return START_STICKY;
        }
        getFusedLocation(this);
        final DisplayMetrics metrics = new DisplayMetrics();
        final WindowManager windowManager = (WindowManager) getSystemService(Context.WINDOW_SERVICE);
        windowManager.getDefaultDisplay().getMetrics(metrics);
        final LayoutInflater inflater = LayoutInflater.from(this);
        final ImageView iconView = (ImageView) inflater.inflate(R.layout.widget_chathead, null, false);
        mFloatingViewManager = new FloatingViewManager(this, this);
        mFloatingViewManager.setFixedTrashIconImage(R.mipmap.ic_launcher);
        mFloatingViewManager.setActionTrashIconImage(R.mipmap.ic_launcher);
        final FloatingViewManager.Options options = new FloatingViewManager.Options();
        options.overMargin = (int) (16 * metrics.density);
        startForeground(NOTIFICATION_ID, createNotification(this));
        return START_STICKY_COMPATIBILITY;
    }

    private Notification createNotification(Context context) {
        final String channelId = context.getString(R.string.channelId);
        Intent intent = new Intent(this, MainActivity.class);
        PendingIntent actionIntent;
        PendingIntent stopActionIntent;
        //intent.setAction(ACTION_STOP_SERVICE);
        Intent stopIntent = new Intent(this, LocationService.class);
        stopIntent.setAction(this.ACTION_STOP_SERVICE);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            stopActionIntent = PendingIntent.getService(this, 0, stopIntent, PendingIntent.FLAG_MUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            actionIntent = PendingIntent.getBroadcast(this, 0, intent, PendingIntent.FLAG_MUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        } else {
            stopActionIntent = PendingIntent.getService(this, 0, stopIntent,PendingIntent.FLAG_UPDATE_CURRENT);
            actionIntent = PendingIntent.getBroadcast(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            final String channelName = context.getString(R.string.channelName);
            final NotificationChannel defaultChannel = new NotificationChannel(channelId, channelName, NotificationManager.IMPORTANCE_LOW);
            final NotificationManager manager = (NotificationManager) context.getSystemService(NOTIFICATION_SERVICE);
            if (manager != null) {
                manager.createNotificationChannel(defaultChannel);
            }
        }

        final NotificationCompat.Builder builder = new NotificationCompat.Builder(context, channelId);
        builder.setWhen(System.currentTimeMillis());
        builder.setSmallIcon(R.mipmap.ic_launcher);
        //builder.addAction(R.mipmap.ic_launcher, "Close Services", actionIntent);
        builder.setFullScreenIntent(actionIntent,true);
        builder.setContentIntent(actionIntent);
        builder.addAction(R.mipmap.ic_launcher, "Close Service", stopActionIntent);
        builder.setContentTitle(context.getString(R.string.app_name));
        builder.setContentText(context.getString(R.string.app_name) + " " + context.getString(R.string.service_running));
        builder.setOngoing(true);
        builder.setPriority(NotificationCompat.PRIORITY_HIGH);
        builder.setCategory(NotificationCompat.CATEGORY_SERVICE);
        return builder.build();
    }

    private void getFusedLocation(LocationService locationService) {
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        mLocationRequest = new LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY)
                .setIntervalMillis(5000)
                .setWaitForAccurateLocation(false)
                .setMinUpdateIntervalMillis(5000)
                .setMaxUpdateDelayMillis(1000)
                .setMinUpdateDistanceMeters(10f)//170f
                .build();

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return;
        }

        locationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(LocationResult locationResult) {
                if (locationResult != null) {
                    Log.e("TAG", "Get Latitude:" + locationResult.getLastLocation().getLatitude());
                    Log.e("TAG", "Get Longitude:" + locationResult.getLastLocation().getLongitude());
                }
            }
        };

        fusedLocationClient.requestLocationUpdates(mLocationRequest, locationCallback,  Looper.myLooper());

        fusedLocationClient.getLastLocation().addOnSuccessListener(location -> {
            Log.e("TAG", "Get Location method ....." + location);
            if (location != null) {
                Log.e("TAG", "Get Lat Lng " + location.getLatitude() + location.getLongitude());
            }
        });
        Log.e("TAG", " Get last location " + fusedLocationClient.getLastLocation());

    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }


    @Override
    public void onFinishFloatingView() {
        Log.e(TAG, "onDestroy: kill app");
        stopSelf();
    }

    @Override
    public void onTouchFinished(boolean isFinishing, int x, int y) {
        if (isFinishing) {
            Log.d(TAG, "FloatingView will be deleted soon.");
        }
    }

}
