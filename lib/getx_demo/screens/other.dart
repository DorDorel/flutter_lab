import 'package:flutter/material.dart';
import 'package:flutter_lab/getx_demo/controllers/counter_controller.dart';
import 'package:get/get.dart';

class OtherScreen extends StatelessWidget {
  OtherScreen({Key? key}) : super(key: key);
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CLICKS: ${counterController.counter.value}"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("back to home screen"),
            )
          ],
        ),
      ),
    );
  }
}
