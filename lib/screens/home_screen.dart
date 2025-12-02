import 'package:flutter/material.dart';

import '../common/string.dart' as strings;
import '../services/mock_service.dart';

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

  late bool _isLoading;

  @override
  void initState() {
    super.initState();

    // _counter = widget.initialCounter;
    _loadCounter();
    print('after _loadCounter?');
  }

  void _loadCounter() async {
    setState(() {
      _isLoading = true;
    });
    print('_isLoading=$_isLoading');

    _counter = await getCounter();

    setState(() {
      _isLoading = false;
    });
    print('_isLoading=$_isLoading');
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
          setState(() {
            _counter++;
          });
          // print(_counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
