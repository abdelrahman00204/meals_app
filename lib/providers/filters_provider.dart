import 'package:flutter_riverpod/legacy.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersProvider extends StateNotifier<Map<Filters, bool>> {
  FiltersProvider()
    : super({
        Filters.glutenFree: false,
        Filters.lactoseFree: false,
        Filters.vegetarian: false,
        Filters.vegan: false,
      });

  void setFilters(Filters filter, bool updatedFilters) {
    state = {...state, filter: updatedFilters};
  }
  void setFiltersMap(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersProvider, Map<Filters, bool>>(
  (ref) => FiltersProvider(),
);
