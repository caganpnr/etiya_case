import 'package:dartz/dartz.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/product/failure/failure.dart';

class GetAgentsUsecase {
  /// Interacts with the getAgent method of the [AgentRepository] and returns
  /// either [Failure] or List of [AgentEntity]
  GetAgentsUsecase({required AgentRepository repository}) : _repository = repository;

  final AgentRepository _repository;

  /// Returns either [Failure] or List of [AgentEntity]
  Future<Either<Failure, List<AgentEntity>>> execute() {
    return _repository.getAgent();
  }
}
