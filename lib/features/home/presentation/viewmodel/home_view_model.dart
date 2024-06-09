import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_view_navigator.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, void>((ref) {
  final navigator = ref.read(homeViewNavigatorProvider);
  return HomeViewModel(navigator);
});

class HomeViewModel extends StateNotifier<void> {
  HomeViewModel(this.navigator) : super(null);

  final HomeViewNavigator navigator;

  void openBatchPage() {
    navigator.openBatchView();
  }
}
