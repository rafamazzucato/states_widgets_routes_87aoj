import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:states_widgets_routes/models/language.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [];

  Widget title = const Text("Minhas Linguagens");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(onPressed: _goToAddLanguage, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 10,
            children: buildChoices(),
          ),
          Expanded(child: ListView(children: buildItemsList()))
        ],
      ),
    );
  }

  void _goToAddLanguage() {
    Future future = Navigator.pushNamed(context, "/add");
    future.then((language) => setState(() {
          languages.add(language);
        }));
  }

  List<ChoiceChip> buildChoices() {
    return languages
        .map((l) => ChoiceChip(
            label: Text(l.title),
            selected: l.select,
            onSelected: (value) => setState(() {
                  l.select = value;
                })))
        .toList();
  }

  List<Widget> buildItemsList() {
    return languages
        .where((l) => l.select)
        .map((l) => Card(
              child: ListTile(
                leading: Icon(l.icon),
                title: Text(l.title),
                subtitle: Text(l.subTitle),
              ),
            ))
        .toList();
  }
}
