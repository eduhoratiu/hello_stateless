import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_stateless/screens/loading_screen.dart';

import '../common/string.dart' as strings;
import '../services/mock_service.dart';
import 'error_screen.dart';

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

  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _loadCounter();
    print('after _loadCounter?');
  }

  /// Loads the counter value from the mock service asynchronously.
  void _loadCounter() async {
    // Indicate loading state and the loading screen should be shown
    setState(() => _isLoading = true);

    try {
      // Await the result from the mock service
      _counter = await getCounter();
    } on SocketException catch (e) {
      // Handle network exception by indicating an error message and that the
      // error screen should be shown
      setState(() => _errorMessage = e.message);
    }

    // Indicate loading is complete and the normal screen should be shown
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // If loading, show loading screen
    if (_isLoading) {
      return const LoadingScreen();
    }

    // If error occurred, show error screen
    if (_errorMessage != null) {
      return ErrorScreen(errorMessage: _errorMessage!);
    }

    // Otherwise, show the normal home screen
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
