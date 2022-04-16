import 'package:flutter/material.dart';

class GoalStat extends StatelessWidget {
  final int homeGoal;
  final int awayGoal;
  final int expandedTime;
  const GoalStat({Key? key, required this.homeGoal, required this.awayGoal, required this.expandedTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            expandedTime.toString(),
            style: const TextStyle(
              fontSize: 30
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '$homeGoal - $awayGoal',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
