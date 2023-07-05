import 'dart:async';

abstract class UseCaseBase<T, Params> {
  FutureOr<T> call(Params params);
}

abstract class UseCaseNoParamsBase<T> {
  FutureOr<T> call();
}
