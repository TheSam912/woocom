import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOption { latest, lowToHigh, highToLow, popular, customerRating }

class SortNotifier extends StateNotifier<SortOption> {
  SortNotifier() : super(SortOption.latest);

  void updateSort(SortOption newSort) {
    state = newSort;
  }
}

final selectedSortProvider =
    StateNotifierProvider<SortNotifier, SortOption>((ref) {
  return SortNotifier();
});
