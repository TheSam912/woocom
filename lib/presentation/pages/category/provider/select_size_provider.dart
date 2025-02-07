import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedFiltersNotifier extends StateNotifier<Map<String, Set<String>>> {
  SelectedFiltersNotifier() : super({});

  void toggleFilter(String category, String value) {
    final newState = Map<String, Set<String>>.from(state);
    final categorySet = Set<String>.from(newState[category] ?? {});

    if (categorySet.contains(value)) {
      categorySet.remove(value);
    } else {
      categorySet.add(value);
    }

    newState[category] = categorySet;
    state = newState;
  }
}

final selectedFiltersProvider =
    StateNotifierProvider<SelectedFiltersNotifier, Map<String, Set<String>>>(
        (ref) {
  return SelectedFiltersNotifier();
});
