import 'package:dartz/dartz.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/feature/agent/domain/usecases/get_agents_usecase.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentRepository mockAgentRepository;
  late GetAgentsUsecase getAgentsUsecase;
  late List<MockAgentEntity> mockAgentEntity;

  setUp(() {
    mockAgentRepository = MockAgentRepository();
    getAgentsUsecase = GetAgentsUsecase(repository: mockAgentRepository);
    mockAgentEntity = List.generate(10, (index) => MockAgentEntity());
  });

  group('Get Agents Usecase Test', () {
    test('Should return list of agent entities when there is no exception', () async {
      when(() => mockAgentRepository.getAgent()).thenAnswer((_) async => Right(mockAgentEntity));
      final result = await getAgentsUsecase.execute();

      verify(() => getAgentsUsecase.execute());
      expect(result, isA<Right<Failure, List<AgentEntity>>>());
    });

    test('Should return Failure when there is an exception', () async {
      when(() => mockAgentRepository.getAgent()).thenAnswer((_) async => Left(DioFailure()));
      final result = await getAgentsUsecase.execute();

      verify(() => getAgentsUsecase.execute());
      expect(result, isA<Left<Failure, List<AgentEntity>>>());
    });
  });
}
