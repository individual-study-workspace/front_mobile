class ResourceState {
  final bool isFabOpen;
  final int currentStep;
  final int? selectedCategoryId; // 추가

  const ResourceState({
    this.isFabOpen = false,
    this.currentStep = 0,
    this.selectedCategoryId, // 추가
  });

  ResourceState copyWith({
    bool? isFabOpen,
    int? currentStep,
    int? selectedCategoryId, // 추가
  }) {
    return ResourceState(
      isFabOpen: isFabOpen ?? this.isFabOpen,
      currentStep: currentStep ?? this.currentStep,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId, // 추가
    );
  }
}
