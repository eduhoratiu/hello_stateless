import 'package:flutter/material.dart';

import '../common/string.dart' as strings;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.initialCounter,
  });

  final int initialCounter;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _counter;

  @override
  void initState() {
    super.initState();

    _counter = widget.initialCounter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.homeScreenTitle),
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   _counter++;
          // });
          _counter++;

          setState(() {});

          print(_counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
