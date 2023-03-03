import 'package:flutter/material.dart';

class MatchDetails {
  final league_name;
  final team1;
  final team2;
  final logo1;
  final logo2;
  final match_time;
  final match_day;

  MatchDetails(this.league_name, this.team1, this.team2, this.logo1, this.logo2,
      this.match_day, this.match_time);
}