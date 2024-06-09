import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/register_view_navigator.dart';

class RegisterViewModel extends StateNotifier<void> {
  RegisterViewModel(this.navigator) : super(null);

  final RegisterViewNavigator navigator;

  
}
