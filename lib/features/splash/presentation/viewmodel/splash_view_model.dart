import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/splash/presentation/navigator/splash_navigator.dart';

// Creating provider for the viewModel
final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, void>((ref) { // 
  final navigator = ref.read(splashViewNavigatorProvider);
  return SplashViewModel(navigator);
});

class SplashViewModel extends StateNotifier<void> {
  SplashViewModel(this.navigator) : super(null);

  // Dependency injection
  final SplashViewNavigator navigator;

  // Open Login Page
  void openLoginPage() {
    Future.delayed(const Duration(seconds: 2), () {
      navigator
          .openLoginView(); // Since we created a mixin named LoginViewRoute, we can use the feature without making an instance for it
    });
  }

  void openHomeScreen() {
    // Home Screen Code
  }
}
