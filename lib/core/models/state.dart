abstract class WithState<E> {
  final E state;
  const WithState({required this.state});
}

class StateWrapper<Value, State> extends WithState<State> {
  final Value value;
  StateWrapper({
    required this.value,
    required State state,
  }) : super(state: state);

  StateWrapper<Value, State> setValue(Value value) {
    return copyWith(value: value);
  }

  StateWrapper<Value, State> setState(State state) {
    return copyWith(state: state);
  }

  StateWrapper<Value, State> copyWith({
    Value? value,
    State? state,
  }) {
    return StateWrapper(state: state ?? this.state, value: value ?? this.value);
  }
}
