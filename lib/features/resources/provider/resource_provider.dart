import 'package:flutter_riverpod/legacy.dart';

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
}
