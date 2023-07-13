import 'package:dartz/dartz.dart';
import 'package:etiya_case/feature/agent/data/datasources/remote/agent_remote_data_source.dart';
import 'package:etiya_case/feature/agent/data/models/agent/agent_model.dart';
import 'package:etiya_case/feature/agent/data/repositories/agent_repository_impl.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAgentRemoteDataSource extends Mock implements AgentRemoteDataSource {}

class MockAgentModel extends Mock implements AgentModel {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentRemoteDataSource mockAgentsRemoteDataSource;
  late AgentRepository agentRepository;
  late List<MockAgentModel> mockAgentModel;

  setUp(() {
    mockAgentsRemoteDataSource = MockAgentRemoteDataSource();

    agentRepository = AgentRepositoryImpl(
      dataSource: mockAgentsRemoteDataSource,
    );
    mockAgentModel = List.generate(10, (index) => MockAgentModel());
  });

  group('Fetch agents', () {
    test('Should return list of agent entities when there is no exception', () async {
      when(() => mockAgentsRemoteDataSource.fetchAgents()).thenAnswer((_) async => mockAgentModel);
      final result = await agentRepository.getAgent();

      verify(() => mockAgentsRemoteDataSource.fetchAgents());
      expect(result, isA<Right<Failure, List<AgentEntity>>>());
    });
  });

  test('Should return Failure type of object when there is an exception', () async {
    when(() => mockAgentsRemoteDataSource.fetchAgents()).thenThrow(Exception());
    final result = await agentRepository.getAgent();

    verify(() => mockAgentsRemoteDataSource.fetchAgents());
    expect(result, isA<Left<Failure, List<AgentEntity>>>());
  });
}
