// Join League is the page where all the details about the league/Contest is given including:
/// League Name
/// Countries
/// Match Time and Day
/// people joined the league
/// wallet balance
/// Instructions before joining the league
/// Selection of Predictive Statements
/// and a pay fee button.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard/leaguePage/allStatements.dart';
import 'package:flutter_application_1/screens/dashboard/leaguePage/statementsPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JoinLeague extends StatelessWidget {
  final league_name;
  final team1;
  final team2;
  final logo1;
  final logo2;
  final match_time;
  final match_day;

  const JoinLeague(
      {super.key,
      this.league_name,
      this.team1,
      this.team2,
      this.logo1,
      this.logo2,
      this.match_day,
      this.match_time});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title:
              league_name != null ? Text(league_name) : const Text("Contest")),
      body: SingleChildScrollView(
          child: Container(
        width: size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // team name and flag icons
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
                          team1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'assets/images/$logo1',
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                    const Text("VS",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        Text(team2,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        SvgPicture.asset(
                          'assets/images/$logo2',
                          width: 50,
                          height: 50,
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    peopleAndFee(Icons.people, Colors.black, "10000",
                        const TextStyle(color: Colors.black)),
                    peopleAndFee(Icons.account_balance_wallet, Colors.black,
                        "230", const TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Instructions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                        "1. You have to select maximum 10 statement from the given below statements."),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return StatementPage(
                                statements: AllStatements,
                                selected_statements: []);
                          }));
                        },
                        icon: const Icon(Icons.spellcheck_rounded),
                        label: const Text("Select Statements"))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget peopleAndFee(icon, iconColor, label, labelStyle) {
    return TextButton.icon(
        onPressed: () {},
        style: TextButton.styleFrom(padding: const EdgeInsets.only(top: 0)),
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          label,
          style: labelStyle,
        ));
  }
}
