import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scarlet_app/data/routes.dart';
// import 'package:scarlet_app/widgets/rtfires_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final prefs = await SharedPreferences.getInstance();
  runApp(MainApp(prefs: prefs));

  FirebaseFirestore.instance
      .collection('rtfires')
      .snapshots()
      .listen((snapshot) {
    for (var change in snapshot.docChanges) {
      if (change.type == DocumentChangeType.added ||
          change.type == DocumentChangeType.modified) {
        // showNotification();
      }
    }
  });
}

class PreferenceProvider extends InheritedWidget {
  final SharedPreferences prefs;

  const PreferenceProvider(
      {super.key, required this.prefs, required super.child});

  static PreferenceProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PreferenceProvider>();
  }

  @override
  bool updateShouldNotify(PreferenceProvider oldWidget) =>
      prefs != oldWidget.prefs;
}

class MainApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MainApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    int? id = prefs.getInt('id');
    bool dataExist = id != null;
    return PreferenceProvider(
        prefs: prefs,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "!Scarlet",
          initialRoute: dataExist ? "-" : "/",
          routes: getApplicationRoutes(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('en'), Locale('es')],
        ));
  }
}
