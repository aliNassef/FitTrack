import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/helpers/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/notification_model.dart';
import '../cubit/get_all_notification_cubit/get_all_notifications_cubit.dart';
import '../widgets/notification_item.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = 'notification-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          injector<GetAllNotificationsCubit>()..getAllNotifications(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Notifications',
                    onBackButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const VerticalSpace(30),
                  Expanded(
                    child: BlocBuilder<GetAllNotificationsCubit,
                        GetAllNotificationsState>(
                      buildWhen: (previous, current) {
                        return current is GetAllNotificationsSuccess ||
                            current is GetAllNotificationsError ||
                            current is GetAllNotificationsLoading;
                      },
                      builder: (context, state) {
                        if (state is GetAllNotificationsLoading) {
                          return _buildLoadingNotificationItem();
                        }
                        if (state is GetAllNotificationsError) {
                          return CustomFailureWidget(
                            errMessage: state.errMessage,
                          );
                        }
                        if (state is GetAllNotificationsSuccess) {
                          return ListView.separated(
                            itemBuilder: (_, index) {
                              return NotificationItem(
                                notificationModel:
                                    state.notificationsModel[index],
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const Divider(
                                color: Color(0xffC6C4D4),
                                height: 1,
                              );
                            },
                            itemCount: state.notificationsModel.length,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ).withHorizontalPadding(30),
            ),
          );
        },
      ),
    );
  }

  Skeletonizer _buildLoadingNotificationItem() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemBuilder: (_, index) {
          return NotificationItem(
            notificationModel: NotificationModel(
              id: '1111',
              recipient: '1111',
              sender: Sender(
                id: '1111',
                name: '1111',
                email: '1111',
              ),
              title: '1111',
              message: '1111',
              icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyenz3c2a6SsginDmI72hFGEuqYJfWnGNBQw&s',
              priority: '1111',
              status: '1111',
              createdAt: '1111',
              updatedAt: '1111',
              version: 0,
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const Divider(
            color: Color(0xffC6C4D4),
            height: 1,
          );
        },
        itemCount: 6,
      ),
    );
  }
}
