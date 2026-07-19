import 'package:flutter_riverpod/legacy.dart';
import 'package:front_mobile/features/resources/model/ResourceCategory%20.dart';

import '../model/resource_state.dart';

final resourceProvider = StateNotifierProvider<ResourceNotifier, ResourceState>(
  (ref) => ResourceNotifier(),
);

class ResourceNotifier extends StateNotifier<ResourceState> {
  ResourceNotifier() : super(const ResourceState());

  void toggleFab() {
    state = state.copyWith(isFabOpen: !state.isFabOpen);
  }

  void closeFab() {
    state = state.copyWith(isFabOpen: false);
  }

  void nextStep() {
    if (state.currentStep < 3) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void resetStep() {
    state = state.copyWith(currentStep: 0);
  }

  void selectCategory(int id) {
    state = state.copyWith(selectedCategoryId: id);
  }

  final mockCategories = [
    ResourceCategory(
      id: 1,
      title: '수업 자료',
      description: '강의 자료, 학습 자료 등',
      icon: 'assets/icons/book_outline.svg',
    ),
    ResourceCategory(
      id: 2,
      title: '과제',
      description: '과제 안내, 제출 자료 등',
      icon: 'assets/icons/clipboard_outline.svg',
    ),
    ResourceCategory(
      id: 3,
      title: '참고 자료',
      description: '참고 문헌, 보조 자료 등',
      icon: 'assets/icons/archive_outline.svg',
    ),
  ];
}
