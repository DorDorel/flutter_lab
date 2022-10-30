/*
Riverpod 2.x 
*/

import 'package:flutter/material.dart';
import 'package:flutter_lab/riverpod/example_five.dart';
import 'package:flutter_lab/riverpod/example_four.dart';
import 'package:flutter_lab/riverpod/example_one.dart';
import 'package:flutter_lab/riverpod/example_three.dart';
import 'package:flutter_lab/riverpod/example_tow.dart';

import 'example_six.dart';

const TextStyle buttonStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class RiverpodHome extends StatelessWidget {
  const RiverpodHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 2 - Demos Selector'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleOne(),
                  ),
                );
              },
              child: const Text(
                "Provider",
                style: buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleTow(),
                  ),
                );
              },
              child: const Text(
                " StateNotifierProvider",
                style: buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleThree(),
                  ),
                );
              },
              child: const Text(
                " StateProvider, FutureProvider ",
                style: buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleFour(),
                  ),
                );
              },
              child: const Text(
                "StreamProvider",
                style: buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleFive(),
                  ),
                );
              },
              child: const Text(
                "ChangeNotifierProvider",
                style: buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverExampleSix(),
                  ),
                );
              },
              child: const Text(
                "Summary: Mix of Providers",
                style: buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
