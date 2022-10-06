import 'package:flutter/material.dart';

class WidgetLifeCycleDemo extends StatefulWidget {
  const WidgetLifeCycleDemo({Key? key}) : super(key: key);

  @override
  _WidgetLifeCycleDemoState createState() => _WidgetLifeCycleDemoState();
}

class _WidgetLifeCycleDemoState extends State<WidgetLifeCycleDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    print("initState");
    _animationController = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
