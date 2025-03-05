import 'package:first_flutter/feature/notification/notification_services.dart';
import 'package:first_flutter/logger.dart';
import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../resources/AppDimensions.dart';

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
            _buildNotificationButton(context, "Local notification", (){
              Logger.log("Local notification");
              // NotificationService.showNotification(
              //   title: "Hello flutter",
              //   body: "This is demo notification"
              // );
            }),

            const SizedBox(height: AppDimensions.margin15),

            _buildNotificationButton(context, "Repeated notification", (){
              Logger.log("Repeated notification");
            })
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton(BuildContext context, String buttonText, VoidCallback onClickListener) {
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
