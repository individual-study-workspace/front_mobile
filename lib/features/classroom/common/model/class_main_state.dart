class ClassMainState {
  final int selectedTabIndex;

  const ClassMainState({this.selectedTabIndex = 0});

  ClassMainState copyWith({int? selectedTabIndex}) {
    return ClassMainState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }
}
