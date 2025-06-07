import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../views/notification_view.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getNotificationUnreadedCount();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.h,
          children: [
            Text(
              'Welcome Back,',
              style: AppStyles.regular12.copyWith(
                color: const Color(0xffA5A3B0),
              ),
            ),
            Text(
              'Masi Ramezanzade',
              style: AppStyles.bold20,
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return current is GetNotificationCountLoaded ||
                current is GetNotificationCountError ||
                current is GetNotificationCountLoading;
          },
          builder: (context, state) {
            if (state is GetNotificationCountLoaded) {
              return CustomIconButton(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    NotificationView.routeName,
                  );
                },
                image: AppIcons.notificationIcon,
                count: state.count,
              );
            } else if (state is GetNotificationCountError) {
              return CustomIconButton(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    NotificationView.routeName,
                  );
                },
                image: AppIcons.notificationIcon,
              );
            } else if (state is GetNotificationCountLoading) {
              return const Skeletonizer(
                enabled: true,
                child: CustomIconButton(
                  image: AppIcons.notificationIcon,
                  count: 0,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
