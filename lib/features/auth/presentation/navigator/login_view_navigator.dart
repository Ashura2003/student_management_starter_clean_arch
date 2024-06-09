import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/register_view_navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/login_view.dart';
import 'package:student_management_starter/features/batch/presentation/navigator/batch_view_navigator.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_view_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

// To open another screen from Login Screen
class LoginViewNavigator with RegisterViewRoute, HomeViewRoute {}

// To open Login Page
mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushRoute(const LoginView());
  }
}
