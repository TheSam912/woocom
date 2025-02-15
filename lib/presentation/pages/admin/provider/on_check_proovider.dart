import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionNotifier extends StateNotifier<List<String>> {
  SelectionNotifier() : super([]);

  void toggleSelection(String id, bool? isChecked) {
    if (isChecked == true) {
      state = [...state, id];
    } else {
      state = state.where((item) => item != id).toList();
    }
  }
}

final selectionProvider =
    StateNotifierProvider<SelectionNotifier, List<String>>((ref) {
  return SelectionNotifier();
});
