import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/usecases/filter_agents_usecase.dart';
import 'package:etiya_case/feature/agent/domain/usecases/get_agents_usecase.dart';
import 'package:etiya_case/feature/agent/presentation/bloc/agents_bloc.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAgentsUsecase extends Mock implements GetAgentsUsecase {}

class MockFilterAgentsUsecase extends Mock implements FilterAgentsUsecase {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late AgentsBloc agentsBloc;
  late MockGetAgentsUsecase mockGetAgentsUsecase;
  late MockFilterAgentsUsecase mockFilterAgentsUsecase;
  late List<MockAgentEntity> mockAgentEntities;

  setUp(() {
    mockGetAgentsUsecase = MockGetAgentsUsecase();
    mockFilterAgentsUsecase = MockFilterAgentsUsecase();

    agentsBloc = AgentsBloc(
      getAgents: mockGetAgentsUsecase,
      filterAgents: mockFilterAgentsUsecase,
    );
    mockAgentEntities = List.generate(10, (index) => MockAgentEntity());
  });

  group('Agents Bloc Tests', () {
    test('Initial state of the Agents Bloc AgentsInitial should be  at start', () {
      expect(agentsBloc.state, AgentsInitial());
    });

    blocTest<AgentsBloc, AgentsState>(
      'GetAgentsUsecase error case test',
      setUp: () {
        when(() => mockGetAgentsUsecase.execute()).thenAnswer(
          (_) async => Left(DioFailure()),
        );
      },
      build: () => agentsBloc,
      act: (bloc) => bloc.add(AgentsFetched()),
      expect: () => [
        AgentsLoading(),
        AgentsFailure(DioFailure()),
      ],
    );

    blocTest<AgentsBloc, AgentsState>(
      'GetAgentsUsecase success case test',
      setUp: () {
        when(() => mockGetAgentsUsecase.execute()).thenAnswer(
          (_) async => Right(mockAgentEntities),
        );
      },
      build: () => agentsBloc,
      act: (bloc) => bloc.add(AgentsFetched()),
      expect: () => [
        AgentsLoading(),
        AgentsLoaded(
          agents: mockAgentEntities,
          filteredAgents: mockAgentEntities,
        ),
      ],
    );
  });
}
