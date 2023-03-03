/// DashBoard Page is consists of All contests page and My contests page

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard/allContestPage.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 231, 226, 226),
        appBar: AppBar(
          title: const Text("Cricket League"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "All Contests",
              ),
              Tab(
                text: "My Contests",
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          AllContests(),
          Center(
              child: Text(
            "My Contests",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ))
        ]),
      ),
    );
  }
}
