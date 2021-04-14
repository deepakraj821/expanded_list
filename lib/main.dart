import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(15, (i) => "Item $i");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue,
                child: ExpansionTile(
                  title: Text(
                    "Top ${items[index]}",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    Container(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(items[index]),
                            ),
                          );
                        },
                        itemCount: 10,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 15));
  }
}
