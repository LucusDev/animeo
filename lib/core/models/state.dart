abstract class WithState<E> {
  const WithState({required this.state});

  final E state;
}

class StateWrapper<Value, State> extends WithState<State> {
  StateWrapper({
    required this.value,
    required State state,
  }) : super(state: state);
  final Value value;

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
