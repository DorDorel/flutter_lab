import 'dart:async';
import 'dart:core';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

// add resturent to firestore resturent collections with cloud function
Future<void> addResturentToFirestore(
    {required String name, required int rate}) async {
  try {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('addResturent');
    await callable.call({"name": name, "rate": rate});
    print('succsess');
  } catch (exp) {
    print(exp);
  }
}
