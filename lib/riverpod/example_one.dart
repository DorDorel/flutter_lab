import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentDate = Provider<DateTime>(
  (_) => DateTime.now(),
);

class RiverExampleOne extends ConsumerWidget {
  const RiverExampleOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Static DateTime"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              date.toIso8601String(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
