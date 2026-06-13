import 'package:flutter/material.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(title??'')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Uh oh... Nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Try selecting a different category.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (title == null) {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index]);
        },
      ),
    );
  }
}
