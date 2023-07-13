import 'package:dartz/dartz.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/product/failure/failure.dart';

///  AgentRepository interface that contains methods to handle agent data
abstract interface class AgentRepository {
  /// Return Either [Failure] or List of AgentEntity
  Future<Either<Failure, List<AgentEntity>>> getAgent();

  /// Returns the list of agents that matches the displayName of the given query
  List<AgentEntity> filterAgents(List<AgentEntity> agents, String query);
}
