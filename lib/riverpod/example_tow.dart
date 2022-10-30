import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension OptionalInFixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}
// void testOptionalInFixAddition() {
//   final int? int1 = 1;
//   const int int2 = 1;
//   final result = int1 + int2;
// }

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() => state = state == null ? state = 1 : state + 1;
  void decrement() => state = state == null ? state = -1 : state! - 1;
}

final counterProvider = StateNotifierProvider<Counter, int?>(
  (ref) => Counter(),
);

class RiverExampleTow extends ConsumerWidget {
  const RiverExampleTow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(counterProvider);
            final text = count == null ? 'Press the  Button' : count.toString();
            return Text(text);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: const Text(
              'Increment count',
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: const Text(
              'Decrement count',
            ),
          ),
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final appBarState = ref.watch(counterProvider);
                return Text(
                  appBarState.toString(),
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
