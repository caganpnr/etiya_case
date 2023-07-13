import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etiya_case/feature/agent/data/datasources/remote/agent_remote_data_source.dart';
import 'package:etiya_case/feature/agent/data/models/agent/agent_model.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/product/exceptions/api_exceptions.dart';
import 'package:etiya_case/product/failure/failure.dart';

class AgentRepositoryImpl implements AgentRepository {
  /// Repository class that implements the AgentRepository interface
  AgentRepositoryImpl({required AgentRemoteDataSource dataSource}) : _dataSource = dataSource;

  final AgentRemoteDataSource _dataSource;

  /// Return Either [Failure] or List of AgentEntity
  @override
  Future<Either<Failure, List<AgentEntity>>> getAgent() async {
    try {
      final response = await _dataSource.fetchAgents();
      // converts List of [AgentModel] to List of [AgentEntity] and returns them as List
      return right(response.map((e) => e.toAgentEntity()).toList());
    } on DioException {
      // return  [DioFailure] in case of a [DioException]
      return left(DioFailure());
    } on NullResponseException {
      // return  [NullResponseFailure] in case of a [NullResponseException]
      return left(NullResponseFailure());
    } catch (_) {
      // return  [UnknownFailure] in case of a [UnknowException]
      return left(UnknownFailure());
    }
  }

  /// Returns the list of agents that matches the displayName of the given query
  @override
  List<AgentEntity> filterAgents(List<AgentEntity> agents, String query) {
    return agents.where((agent) => agent.displayName.toLowerCase().contains(query)).toList();
  }
}
