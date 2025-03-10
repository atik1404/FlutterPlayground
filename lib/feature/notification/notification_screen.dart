import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../resources/AppColors.dart';
import '../../resources/AppDimensions.dart';
import 'notification_repository.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        padding: AppDimensions.kPadding10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNotificationButton(context, "Local notification", () {
              Fluttertoast.showToast(msg: "Local notification", toastLength: Toast.LENGTH_LONG);
              NotificationRepository().showNotification(
                title: "Hello flutter",
                body: "This is flutter notification description"
              );
            }),
            const SizedBox(height: AppDimensions.margin15),
            _buildNotificationButton(context, "Scheduled notification", () {
              Fluttertoast.showToast(msg: "Repeated notification", toastLength: Toast.LENGTH_LONG);
              DateTime dateTime = DateTime.now().add(Duration(seconds: 5));
              NotificationRepository().scheduledNotification(
                dateTime,
                title: "Schedule notification",
                body: "This is schedule notification"
              );
            }),

            const SizedBox(height: AppDimensions.margin15),

            _buildNotificationButton(context, "Interval based notification", () {
              Fluttertoast.showToast(msg: "Interval based  notification", toastLength: Toast.LENGTH_LONG);
              NotificationRepository().intervalNotification(
                  title: "Interval notification",
                  body: "This is interval notification in every minute"
              );
            }),

            const SizedBox(height: AppDimensions.margin15),

            _buildNotificationButton(context, "Daily at specific time", () {
              Fluttertoast.showToast(msg: "Daily at specific time notification", toastLength: Toast.LENGTH_LONG);
              NotificationRepository().intervalNotification(
                  title: "Daily notification",
                  body: "This is daily notification in every day"
              );
            }),

            const SizedBox(height: AppDimensions.margin15),

            _buildNotificationButton(context, "Weekly at specific time", () {
              Fluttertoast.showToast(msg: "Weekly at specific time notification", toastLength: Toast.LENGTH_LONG);
              NotificationRepository().intervalNotification(
                  title: "Weekly notification",
                  body: "This is weekly notification in every week"
              );
            }),

            const SizedBox(height: AppDimensions.margin15),

            _buildNotificationButton(context, "Notification with Image", () {
              Fluttertoast.showToast(msg: "Notification with Image notification", toastLength: Toast.LENGTH_LONG);
              NotificationRepository().notificationWithImage(
                  title: "Image notification",
                  body: "This is image notification",
                  imageUrl: "https://media.architecturaldigest.com/photos/66a914f1a958d12e0cc94a8e/16:9/w_1920,c_limit/DSC_5903.jpg"
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton(
      BuildContext context, String buttonText, VoidCallback onClickListener) {
    return Padding(
        padding: AppDimensions.kPaddingH15,
        child: SizedBox(
          width: double.infinity,
          height: AppDimensions.kSizeH45.height,
          child: FilledButton(
            onPressed: onClickListener,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.mdRed600,
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppDimensions.regularTextSize,
              ),
            ),
          ),
        ));
  }
}
