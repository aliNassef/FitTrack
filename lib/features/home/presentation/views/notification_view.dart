import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:flutter/material.dart';
import '../widgets/notification_item.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = 'notification-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notifications',
          ),
          VerticalSpace(30),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return const NotificationItem();
                },
                separatorBuilder: (_, index) {
                  return const Divider(
                    color: Color(0xffC6C4D4),
                    height: 1,
                  );
                },
                itemCount: 6),
          ),
        ],
      ).withHorizontalPadding(30),
    ));
  }
}
