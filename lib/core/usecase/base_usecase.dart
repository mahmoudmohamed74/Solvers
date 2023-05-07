import 'package:equatable/equatable.dart';

abstract class BaseUseCase<R, P> {
  Future<R> call({required P params});
}

abstract class BaseUseCaseTwoParams<R, A, B> {
  Future<R> call({required A paramsOne, required B paramsTwo});
}

abstract class BaseUseCaseThreeParams<R, A, B, C> {
  Future<R> call(
      {required A paramsOne, required B paramsTwo, required C paramsThree});
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
