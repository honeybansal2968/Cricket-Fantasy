import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard/leaguePage/statementView.dart';

// Statement Widget having statement and delete Icon

typedef OnDelete();

class Statement extends StatefulWidget {
  final StatementView statement;
  final OnDelete onDelete;
  Statement({super.key, required this.statement, required this.onDelete});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.statement.statement),
              IconButton(
                  onPressed: widget.onDelete, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
