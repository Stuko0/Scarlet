package com.example.scarlet_app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class ScarletHomeWidget : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.scarlet_home_widget)

            val data = HomeWidgetPlugin.getData(context)
            val status = data.getString("duty_status", "off-duty")
            val isOnDuty = status == "on-duty"

            views.setTextViewText(R.id.widget_status, if (isOnDuty) "EN SERVICIO" else "FUERA DE SERVICIO")
            views.setInt(
                R.id.widget_root,
                "setBackgroundColor",
                if (isOnDuty) 0xFF2ECC71.toInt() else 0xFFE74C3C.toInt()
            )

            val intent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
