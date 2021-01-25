import 'package:flutter/material.dart';
import 'package:state_management_flutter_week/bloc/app_bloc.dart';
//import 'package:state_management_flutter_week/redux/app_store.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  //int _counter = 0;
  final appBloc = AppBloc();

  void _incrementCounter() {
    appBloc.add(AppEvent.increment);
    //appStore.dispatcher(AppAction.increment);
    /*setState(() {
      _counter++;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            StreamBuilder(
              stream: appBloc,
              builder: (_, __) {
                return Text(
                  '${appBloc.state.toString()}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            /*AnimatedBuilder(
              animation: appStore,
              builder: (_, __) {
                return Text(
                  '${appStore.state.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
