import 'package:flutter/material.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/screens/ingriediants_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_duration.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => IngriediantsScreen(
                meal: meal,

              ),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealDuration(duration: meal.duration),

                        SizedBox(width: 12),
                        Icon(Icons.work, color: Colors.white),
                        SizedBox(width: 6),
                        Text(
                          complexityText,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.attach_money, color: Colors.white),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            affordabilityText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
