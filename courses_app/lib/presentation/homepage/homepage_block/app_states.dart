class AppState {
  int counter;
  AppState({required this.counter});
  @override
  String toString() {
    return 'counter: $counter';
  }
}

class InitStates extends AppState {
  InitStates() : super(counter: 0);
}
