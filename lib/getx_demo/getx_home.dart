import 'package:flutter/material.dart';
import 'package:flutter_lab/getx_demo/controllers/counter_controller.dart';
import 'package:flutter_lab/getx_demo/screens/other.dart';
import 'package:get/get.dart';

class TryGetx extends StatelessWidget {
  TryGetx({Key? key}) : super(key: key);
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try Getx"),
      ),
      body: Obx(
        (() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CLICKS: ${counterController.counter.value}"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(OtherScreen());
                    },
                    child: const Text("open other screen"),
                  )
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
