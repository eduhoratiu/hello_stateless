// Define a custom exception for network errors
import 'dart:io';

Future<int> getCounter() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 10));

  // Simulate a network exception
  throw SocketException('Network error');

  return 42;
}
