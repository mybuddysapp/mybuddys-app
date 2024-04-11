import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import 'package:mybuddys/algo/model/team/team.dart';

class MyTeamCard extends StatelessWidget {
  final Team team;

  const MyTeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(team.name),
          Text(team.captain.pseudonym),
          Text(
            team.players!.toList().length.toString(),
          ),

        ],
      ),
    );
  }
}
