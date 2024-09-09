import 'package:flutter/material.dart';

// This stuff leverge the State Hoisting principle, more alike in Compose

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ModulePage(),
    );
  }
}

class ModulePage extends StatefulWidget{

  const ModulePage({super.key});

  @override
  State<StatefulWidget> createState() => _ModulePageState();


}

class _ModulePageState extends State<ModulePage>{
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SetState Management"),
        actions: [
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DoneModuleList(doneModuleList: doneModuleList),
                ));
              }
          )
        ],
      ),
      body: ModuleList(doneModuleList: doneModuleList),
    );
  }
}

class ModuleList extends StatefulWidget{

  final List<String> doneModuleList;

  const ModuleList({super.key, required this.doneModuleList});

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  final List<String> _moduleList = const [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Program Dart Pertamamu',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: _moduleList.length,
        itemBuilder: (context, index) {
          return ModuleTile(
            moduleName : _moduleList[index],
            isDone: widget.doneModuleList.contains(_moduleList[index]),
            onClick: () {
              setState(() {
                widget.doneModuleList.add(_moduleList[index]);
              });
            },
          );
        }
      );
  }
}

class ModuleTile extends StatelessWidget{
  final String moduleName;
  final bool isDone;
  final Function() onClick;
  
  const ModuleTile({super.key, required this.moduleName, required this.onClick, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone ?
          const Icon(Icons.done) :
          ElevatedButton(
            child: Text("Done"),
            onPressed: onClick
          ),
    );
  }
  
}

/**
 * Done Module List
 * */
class DoneModuleList extends StatelessWidget {
  final List<String> doneModuleList;

  const DoneModuleList({super.key, required this.doneModuleList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Module List'),
      ),
      body: ListView.builder(
        itemCount: doneModuleList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
            trailing: const Icon(Icons.check),
          );
        },
      ),
    );
  }
}
