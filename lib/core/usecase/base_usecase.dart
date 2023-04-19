import 'package:equatable/equatable.dart';

abstract class BaseUseCase<R, P> {
  Future<R> call({required P params});
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
