sealed class Result<S, F> {
  const Result();

  T fold<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  });

  bool get isSuccess => this is Success<S, F>;
  bool get isFailure => this is Failure<S, F>;

  S? get successOrNull => isSuccess ? (this as Success<S, F>).value : null;
  F? get failureOrNull => isFailure ? (this as Failure<S, F>).error : null;
}

final class Success<S, F> extends Result<S, F> {
  final S value;
  const Success(this.value);

  @override
  T fold<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  }) =>
      onSuccess(value);
}

final class Failure<S, F> extends Result<S, F> {
  final F error;
  const Failure(this.error);

  @override
  T fold<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  }) =>
      onFailure(error);
}

final class Unit {
  const Unit._();
}

const unit = Unit._();
