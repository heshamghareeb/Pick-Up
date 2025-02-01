import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../networking/api_result.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
