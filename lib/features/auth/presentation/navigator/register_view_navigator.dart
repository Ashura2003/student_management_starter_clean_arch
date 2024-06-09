import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/register_view.dart';

// If I have to call anyone
class RegisterViewNavigator {}

// In case someone calls Register
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
