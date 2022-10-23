import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lab/hooks/hooks_demo_fundamentals.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
