import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/complete_profile_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/signup_welcome_view.dart';
import '../../features/auth/presentation/views/sucess_registration_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../../features/meal_planner/presentation/view/category_meal_view.dart';
import '../../features/meal_planner/presentation/view/meal_details_view.dart';
import '../../features/meal_planner/presentation/view/meal_planner_view.dart';
import '../../features/meal_planner/presentation/view/meal_scheduale_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/welcome_view.dart';
import '../../features/profile/presentation/views/statistics_view.dart';
import '../../features/store/presentation/views/checkout_view.dart';
import '../../features/workout/presentation/view/workout_details_view.dart';
import '../../features/workout/presentation/view/workout_excersises_view.dart'
    show WorkoutExerciseView;
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

    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LayoutView(),
      );
    case NotificationView.routeName:
      return MaterialPageRoute(
        builder: (context) => const NotificationView(),
      );

    case WorkoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WorkoutView(),
      );
    case WorkoutDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WorkoutDetailsView(),
      );
    case WorkoutExerciseView.routeName:
      return MaterialPageRoute(
        builder: (context) => const WorkoutExerciseView(),
      );
    case MealPlannerView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MealPlannerView(),
      );
    case CategoryMealView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CategoryMealView(),
      );
    case MealDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MealDetailsView(),
      );
    case MealSchedualeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MealSchedualeView(),
      );
    case StatisticsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const StatisticsView(),
      );
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CheckoutView(),
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
