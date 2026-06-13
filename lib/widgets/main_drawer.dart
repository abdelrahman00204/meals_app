import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onTitleSelected});

  final void Function(String title) onTitleSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.7),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.9),
                ),
                SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onTitleSelected('Meals');
            },
            leading:  Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              onTitleSelected('Filters');
            },
            leading:  Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
