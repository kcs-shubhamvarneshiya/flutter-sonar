package com.example.akdmvisitorsapp.util

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences

object CM {
    fun setSp(activity: Context, key: String, value: Any) {
        if(value!=null){
            var prefs: SharedPreferences? = activity.getSharedPreferences(
                activity.packageName,
                Activity.MODE_PRIVATE
            )
            var editor: SharedPreferences.Editor? = prefs!!.edit()
            when (value) {
                is String -> editor!!.putString(key, value)
                is Boolean -> editor!!.putBoolean(key, value)
                is Int -> editor!!.putInt(key, value)
                is Long -> editor!!.putLong(key, value)
                is Float -> editor!!.putFloat(key, value)
            }
            editor!!.commit()
            editor = null
            prefs = null

        }
    }

    fun getSp(activity: Context?, key: String, defaultValue: Any): Any {
        val prefs = activity!!.getSharedPreferences(
            activity.packageName, Activity.MODE_PRIVATE
        )
        return when (defaultValue) {
            is String -> prefs.getString(key, defaultValue)!!
            is Boolean -> prefs.getBoolean(key, defaultValue)
            is Int -> prefs.getInt(key, defaultValue)
            is Long -> prefs.getLong(key, defaultValue)
            else -> prefs.getFloat(key, defaultValue as Float)
        }
    }
}