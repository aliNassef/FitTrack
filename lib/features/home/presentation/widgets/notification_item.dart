import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:fit_track_app/features/home/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.secondaryColor,
        child: Image.network(
          notificationModel.icon ?? '',
          height: 20,
          width: 20,
        ),
      ),
      title: Text(
        notificationModel.title,
        style: AppStyles.medium12.copyWith(
          color: AppColors.blackColor,
        ),
      ),
      subtitle: Text(
        notificationModel.createdAt,
        style: AppStyles.regular10.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: const Icon(
        Icons.more_vert_outlined,
        color: AppColors.greyColor,
      ),
    );
  }
}
