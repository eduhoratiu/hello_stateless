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

  void _loadCounter() async {
    setState(() {
      _isLoading = true;
    });
    print('_isLoading=$_isLoading');

    try {
      _counter = await getCounter();
    } on SocketException catch (e) {
      print('Error loading counter: $e');
      setState(() {
        // _counter = widget.initialCounter;
        _errorMessage = e.message;
      });
    }

    setState(() {
      _isLoading = false;
    });
    print('_isLoading=$_isLoading');
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
