import 'package:dio/dio.dart';
import 'package:etiya_case/core/manager/network/network_manager.dart';
import 'package:etiya_case/feature/agent/data/datasources/remote/agent_remote_data_source.dart';
import 'package:etiya_case/feature/agent/data/repositories/agent_repository_impl.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/feature/agent/domain/usecases/filter_agents_usecase.dart';
import 'package:etiya_case/feature/agent/domain/usecases/get_agents_usecase.dart';
import 'package:etiya_case/feature/agent/presentation/bloc/agents_bloc.dart';
import 'package:get_it/get_it.dart';

/// Global service locator
final getIt = GetIt.instance;

void initServices() {
  // Features - Agents
  // Bloc
  getIt
    ..registerFactory(
      () => AgentsBloc(
        getAgents: getIt(),
        filterAgents: getIt(),
      ),
    )
    // Use cases
    ..registerFactory(
      () => GetAgentsUsecase(
        repository: getIt(),
      ),
    )
    ..registerFactory(
      () => FilterAgentsUsecase(
        repository: getIt(),
      ),
    )
    // Repository
    ..registerFactory<AgentRepository>(
      () => AgentRepositoryImpl(
        dataSource: getIt(),
      ),
    )

    // Datasource
    ..registerFactory(
      () => AgentRemoteDataSource(
        networkManager: getIt(),
      ),
    )

    // Core
    ..registerLazySingleton(
      () => NetworkManager(
        dio: getIt(),
      ),
    )
    ..registerFactory(Dio.new);
}
