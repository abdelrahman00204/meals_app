import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/faviorite_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setscreen(String title) async {
    if (title == 'Meals') {
      Navigator.pop(context);
    } else if (title == 'Filters') {
      Navigator.pop(context);
      await Navigator.push<Map<Filters, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final activefilter = ref.watch(filtersProvider);
    final availablemeals = dummyMeals.where((meal) {
      if (activefilter[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilter[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(availableMeals: availablemeals);

    var title = 'Categories';
    if (_selectedIndex == 1) {
      final favorites = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favorites);
      title = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: MainDrawer(onTitleSelected: setscreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
