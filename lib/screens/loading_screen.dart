import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Loading counter...'),
            const SizedBox(height: 8),
            Text('Please wait a moment.'),
            const SizedBox(height: 8),
            Text('This may take up to 10 seconds.'),
            const SizedBox(height: 8),
            Text('Thank you for your patience!'),
          ],
        ),
      ),
    );
  }
}
