/// All Contest Page Contains a Expandable Container in which all the active contests are stored.
/// every Contest is named as MatchCard

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard/leaguePage/joinLeague.dart';
import 'package:flutter_application_1/screens/signUp/signup.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'leagueDetails.dart';

class AllContests extends StatelessWidget {
  const AllContests({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            MatchCard(
              match_detials: MatchDetails('World Cup', 'India', 'Australia',
                  'in.svg', 'au.svg', 'Sunday', '6:00 PM'),
            ),
            MatchCard(
                match_detials: MatchDetails('World Cup', 'India', 'Afganistan',
                    'in.svg', 'af.svg', 'Wednesday', '6:00 PM')),
            MatchCard(
                match_detials: MatchDetails('World Cup', 'India', 'Argentina',
                    'in.svg', 'ag.svg', 'Saturday', '6:00 PM')),
            MatchCard(
                match_detials: MatchDetails('World Cup', 'India', 'Pakistan',
                    'in.svg', 'pk.svg', 'Wednesday', '9:00 PM')),
            MatchCard(
                match_detials: MatchDetails('World Cup', 'India', 'Bangladesh',
                    'in.svg', 'ba.svg', 'Sunday', '12:00 PM')),
          ],
        ),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  MatchDetails match_detials;
  MatchCard({super.key, required this.match_detials});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 160,
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 150, 88, 161),
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(5, 5),
            )
          ],
          color: const Color.fromARGB(255, 245, 245, 239),
          border: Border.all(),
        ),
        child: Column(
          children: [
            ClipPath(
              clipper: MessageClipper(
                borderRadius: 25,
              ),
              child: Container(
                height: 35,
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Color.fromARGB(255, 17, 0, 255),
                    ])),
                child: const Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          match_detials.team1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'assets/images/${match_detials.logo1}',
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                    const Text("VS",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        Text(match_detials.team2,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'assets/images/${match_detials.logo2}',
                          width: 50,
                          height: 50,
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "IST ${match_detials.match_time} ${match_detials.match_day}"),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return JoinLeague(
                              league_name: match_detials.league_name,
                              logo1: match_detials.logo1,
                              logo2: match_detials.logo2,
                              match_day: match_detials.match_day,
                              match_time: match_detials.match_time,
                              team1: match_detials.team1,
                              team2: match_detials.team2,
                            );
                          }));
                        },
                        style: const ButtonStyle(),
                        child: const Text("Join League"),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
