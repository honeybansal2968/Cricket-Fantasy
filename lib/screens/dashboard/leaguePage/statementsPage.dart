// Statement Page Contains a Scaffold in which there are 2 containers:
// 1. first container stores all statements with checkbox
// 2. Second Container stores all selected Statements with delete icon

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard/leaguePage/statementView.dart';
import 'statementStructure.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({
    super.key,
    required this.statements,
    required this.selected_statements,
  });
  final List statements;
  final List selected_statements;

  @override
  State<StatementPage> createState() => _StatementPageState();
}

List temp = [];
const maxLength = 10;

class _StatementPageState extends State<StatementPage> {
  int numberOfSelectedStatements = 0;
  List<Statement> selectedStatements = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool? checked = false;

    return Scaffold(
      appBar: AppBar(title: const Text("Select Statements")),
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.43,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 219, 219, 218),
                    Color.fromARGB(255, 233, 232, 228),
                    Color.fromARGB(255, 241, 241, 234),
                    Color.fromARGB(255, 238, 238, 233),
                  ]),
                  borderRadius: BorderRadius.circular(15)),
              child: ListView.builder(
                  itemCount: widget.statements.length,
                  itemBuilder: (BuildContext context, int index) {
                    final statementName = widget.statements[index];
                    return Material(
                      shape: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      child: Container(
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 253, 251, 251)),
                          onPressed: () {
                            setState(() {
                              addStatement(statementName);
                              deleteFromMainList(statementName);
                            });
                          },
                          child: Container(
                            child: Text(statementName),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Your Selected Statements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: size.height * 0.408,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 219, 219, 218),
                    Color.fromARGB(255, 233, 232, 228),
                    Color.fromARGB(255, 241, 241, 234),
                    Color.fromARGB(255, 248, 248, 246),
                  ]),
                  borderRadius: BorderRadius.circular(15)),
              child: selectedStatements.isEmpty
                  ? const Center(
                      child: Text("No Selected Statements"),
                    )
                  : ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount: selectedStatements.length,
                      itemBuilder: (BuildContext context, int index) {
                        return selectedStatements[index];
                      }),
            )
          ],
        ),
      ),
    );
  }

  void addStatement(new_statement) {
    setState(() {
      var _statement = StatementView(new_statement);
      selectedStatements.add(Statement(
        statement: _statement,
        onDelete: () => onDelete(_statement),
      ));
    });
  }

  void onDelete(StatementView statement) {
    setState(() {
      var find = selectedStatements
          .firstWhere((element) => element.statement == statement);
      if (find != null) {
        widget.statements.add(find.statement.statement);
        selectedStatements.removeAt(selectedStatements.indexOf(find));
      }
    });
  }

  void deleteFromMainList(String main_statement) {
    setState(() {
      var find =
          widget.statements.firstWhere((element) => element == main_statement);
      if (find != null) {
        widget.statements.removeAt(widget.statements.indexOf(find));
      }
    });
  }
}
