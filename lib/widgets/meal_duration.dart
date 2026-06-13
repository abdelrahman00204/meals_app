import 'package:flutter/material.dart';

class MealDuration extends StatelessWidget {
  final int duration;

   const MealDuration({super.key,required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.schedule,
          color: Colors.white,
        ),
        SizedBox(width: 6),
        Text(
          '$duration min',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}