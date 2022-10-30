import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lab/riverpod/riverpod_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';
import 'hooks/hooks_demo_fundamentals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // App = Riverpod demo application root widget
    const ProviderScope(
      child: App(),
    ),

    // MyApp = Getx, Hooks, freezed demo application root widget
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Try project before use in real project',
    //   theme: ThemeData(
    //     primarySwatch: Colors.cyan,
    //   ),
    // home: CloudFunctionScreen()
    // home: UploadImage()
    // home: WidgetLifeCycleDemo(),
    // home: const LetsTryDataClassWithFreezed()
    //);

    /*
    this is a root widget for getx project
    */
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Try project before use in real project',
    //   theme: ThemeData(
    //     primarySwatch: Colors.cyan,
    //   ),
    //   home: TryGetx(),
    // );

    /*
    this is a root widget for flutter hooks demo
     */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HooksDemoFundamentals(),
    );
  }
}

/*
    App is a root widget for riverpod 2.x demo
  */

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const RiverpodHome(),
    );
  }
}
