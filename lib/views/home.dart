import 'package:flutter/material.dart';
import 'package:footbal_scoreboard/models/index.dart';
import 'package:footbal_scoreboard/services/SoccerService.dart';
import 'package:footbal_scoreboard/widgets/goal-stat.dart';
import 'package:footbal_scoreboard/widgets/match-tile.dart';
import 'package:footbal_scoreboard/widgets/team-stat.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'SOCCERBOARD',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatchesFromMockData(),
        builder: (BuildContext context, AsyncSnapshot  snapshot) {
          if (snapshot.hasData) {
            return pageBody(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget pageBody(BuildContext context, List<SoccerMatch> matches) {
    print(matches);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamStat(
                  team: 'Local Team',
                  logoUrl: matches[0].home.logoUrl,
                  teamName: matches[0].home.name
                ),
                GoalStat(
                    homeGoal: matches[0].goal.home,
                    awayGoal: matches[0].goal.away,
                    expandedTime: matches[0].fixture.status.elapsedTime
                ),
                TeamStat(
                    team: 'Away Team',
                    logoUrl: matches[0].away.logoUrl,
                    teamName: matches[0].away.name
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF4373D9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'MATCHES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: matches.length,
                      itemBuilder: (context, index) => MatchTile(match: matches[index],),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
