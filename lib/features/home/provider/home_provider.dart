import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../model/home_state.dart';
import '../repository/home_repository.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref.read(apiClientProvider)),
);

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(ref.read(homeRepositoryProvider)),
);

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository _repository;

  HomeNotifier(this._repository)
    : super(
        HomeState(
          currentMonth: DateTime.now(),
          selectedDate: DateTime.now(),
          isLoading: true,
        ),
      ) {
    fetchSchedules();
  }

  Future<void> fetchSchedules() async {
    state = state.copyWith(isLoading: true);

    try {
      final schedules = await _repository.fetchSchedules();
      state = state.copyWith(schedules: schedules, isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void selectTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void goToPreviousMonth() {
    final month = state.currentMonth;
    state = state.copyWith(currentMonth: DateTime(month.year, month.month - 1));
  }

  void goToNextMonth() {
    final month = state.currentMonth;
    state = state.copyWith(currentMonth: DateTime(month.year, month.month + 1));
  }
}
