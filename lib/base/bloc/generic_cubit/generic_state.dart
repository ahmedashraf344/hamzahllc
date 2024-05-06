part of 'generic_cubit.dart';

abstract class GenericState<T> extends Equatable {
  const GenericState(this.data, {this.changed});
  final T data;
  final bool? changed;
}

class GenericInitialState<T> extends GenericState<T> {
  const GenericInitialState(super.data) : super(changed: false);

  @override
  List<Object> get props => [data!,changed!];
}


class GenericUpdateState<T> extends GenericState<T> {
  const GenericUpdateState(super.data, {super.changed});

  @override
  List<Object> get props => [data!,changed!];
}
