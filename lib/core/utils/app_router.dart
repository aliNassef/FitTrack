import 'package:flutter/material.dart';

import '../../features/activity/presentation/views/activity_view.dart';
import '../../features/auth/presentation/views/complete_profile_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/signup_welcome_view.dart';
import '../../features/auth/presentation/views/sucess_registration_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/welcome_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/workout/presentation/view/workout_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case CompleteProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CompleteProfileView(),
      );
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    case WelcomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WelcomeView(),
      );
    case SignupWelcomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupWelcomeView(),
      );
    case SuccessfulRegistrationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SuccessfulRegistrationView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LayoutView(),
      );
    case NotificationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const NotificationView(),
      );
    case ActivityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ActivityView(),
      );
    case ProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfileView(),
      );
    case WorkoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WorkoutView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

PageRouteBuilder<dynamic> goToPageWithAnimation(
  Widget page,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Durations.medium2,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
