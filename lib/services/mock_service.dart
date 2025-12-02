Future<int> getCounter() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 10));

  return 42;
}
