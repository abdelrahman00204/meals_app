import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/data/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meals_app/data/dummy_data.dart';

const _prefsKey = 'favorite_meal_ids';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider() : super([]) {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_prefsKey) ?? [];
    // Look up full Meal objects from dummyMeals by their id
    state = ids
        .map(
          (id) => dummyMeals.firstWhere(
            (m) => m.id == id,
            orElse: () => throw Exception('Meal $id not found'),
          ),
        )
        .toList();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, state.map((m) => m.id).toList());
  }

  bool toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((id) => id != meal).toList();
      return false;
    } else {
      state = [...state, meal];
      
    }
    _saveToPrefs(); // persist after every toggle
    return !isFavorite;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsProvider, List<Meal>>(
      (ref) => FavoriteMealsProvider(),
    );
