import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url0 = 'https://bit.ly/3qYOtDm';
const url1 = 'https://bit.ly/3x7J5Qt';

enum Action {
  rotateLeft,
  rotateRight,
  moreVisible,
  lessVisible,
}

@immutable
class State {
  final double rotationDegree;
  final double alpha;

  const State({required this.rotationDegree, required this.alpha});

  const State.zero()
      : rotationDegree = 0.0,
        alpha = 1.0;

  State rotateRight() => State(
        rotationDegree: rotationDegree + 10.0,
        alpha: alpha,
      );

  State rotateLeft() => State(
        rotationDegree: rotationDegree - 10.0,
        alpha: alpha,
      );

  State increaseAlpha() => State(
        rotationDegree: rotationDegree,
        alpha: min(alpha + 0.1, 1.0),
      );

  State decreaseAlpha() => State(
        rotationDegree: rotationDegree,
        alpha: max(alpha - 0.1, 0.0),
      );
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.rotateLeft:
      return oldState.rotateLeft();
    case Action.rotateRight:
      return oldState.rotateRight();
    case Action.moreVisible:
      return oldState.increaseAlpha();
    case Action.lessVisible:
      return oldState.decreaseAlpha();
    case null:
      return oldState;
  }
}

const TextStyle buttonSize = TextStyle(
  fontSize: 14.0,
);

class HooksDemoTow extends HookWidget {
  const HooksDemoTow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(
      onListen: () {
        controller.sink.add(0.0);
      },
    );
    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Second Demo App',
          style: TextStyle(
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
          const SizedBox(
            height: 50.0,
          ),
          StreamBuilder<double>(
            stream: controller.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                final rotation = snapshot.data ?? 0.0;
                return GestureDetector(
                  onTap: () {
                    controller.sink.add(rotation + 10.0);
                  },
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(rotation / 360.0),
                    child: Center(
                      child: Image.network(url0),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateLeft);
                },
                child: const Text(
                  'Rotate Right',
                ),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateRight);
                },
                child: const Text('Rotate Left'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.lessVisible);
                },
                child: const Text('Decrease alpha'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.moreVisible);
                },
                child: const Text('Increase alpha'),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Opacity(
            opacity: store.state.alpha,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(
                store.state.rotationDegree / 360.0,
              ),
              child: Image.network(url1),
            ),
          )
        ],
      ),
    );
  }
}
