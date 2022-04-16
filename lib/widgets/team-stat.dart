import 'package:flutter/material.dart';

class TeamStat extends StatelessWidget {
  final String team;
  final String logoUrl;
  final String teamName;
  const TeamStat({Key? key, required this.team, required this.logoUrl, required this.teamName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            team,
            style: const TextStyle(
              fontSize: 18.0
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Image.network(
              logoUrl,
              width: 54,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}
