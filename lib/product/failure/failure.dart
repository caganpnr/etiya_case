import 'package:equatable/equatable.dart';

/// Used sealed classes to exhaustively match all of its sub classes in the switch statements
sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class DioFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class NullResponseFailure extends Failure {
  @override
  List<Object?> get props => [];
}
