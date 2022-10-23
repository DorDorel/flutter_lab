import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lab/hooks/hooks_demo_one.dart';
import 'package:flutter_lab/hooks/hooks_demo_tow.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

const imgUrl = 'https://bit.ly/3qYOtDm';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (value) => from - value)
        .takeWhile((element) => element >= 0)
        .listen((value) {
      this.value = value;
    });
  }
  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class HooksDemoFundamentals extends HookWidget {
  const HooksDemoFundamentals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // step 1 - useStream
    final dateTime = useStream(getTime());

    // step 2 - useState, useTextEditingController, useEffect
    final controller = useTextEditingController();
    final text = useState('');
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);

    // step 3 - useMemoized, useFuture
    final future = useMemoized(
      () => NetworkAssetBundle(Uri.parse(imgUrl))
          .load(imgUrl)
          .then((value) => value.buffer.asUint8List())
          .then((value) => Image.memory(value)),
    );
    final snapshot = useFuture(future);

    // step 4 - useListenable, useMemoized
    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          // step 1 implement
          dateTime.data ?? "Home",
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white24,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          // step 2 implement
          TextField(
            controller: controller,
          ),
          Text(
            'You typed ${text.value}',
          ),
          const SizedBox(
            height: 30.0,
          ),
          // step 3 implement
          snapshot.hasData ? snapshot.data : null,
          const SizedBox(
            height: 30.0,
          ),
          // step 4
          Text(
            notifier.value.toString(),
            style: const TextStyle(fontSize: 22.0),
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HooksDemoOne(),
                ),
              );
            },
            child: const Text(
              "Move to First Demo Screen",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HooksDemoTow(),
                ),
              );
            },
            child: const Text(
              "Move to Second Demo Screen",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ].compactMap().toList(),
        // step 4 implement
      ),
    );
  }
}
