class ResourceState {
  /// 플로팅 버튼 메뉴 열림 여부
  final bool isFabOpen;

  const ResourceState({this.isFabOpen = false});

  ResourceState copyWith({bool? isFabOpen}) {
    return ResourceState(isFabOpen: isFabOpen ?? this.isFabOpen);
  }
}
