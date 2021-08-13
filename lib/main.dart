import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/routes/home/home.dart';
import 'package:flutter_app/store/index.dart';

import 'routes/playlist/PlaylistView.dart';

void main() {
  final store = Store<AppState>(appReducer, initialState: AppState.empty());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  MyApp({Key key, this.store}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StoreProvider(
            store: store,
            child: MaterialApp(
              title: 'Spotify',
              theme: ThemeData(
                textTheme: Typography.whiteMountainView,
                colorScheme: ColorScheme.dark(primary: Color(0x111111)),
                primarySwatch: Colors.red,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => MyHomePage(),
                '/playlist': (context) => PlaylistView()
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading...");
      },
    );
  }
}
