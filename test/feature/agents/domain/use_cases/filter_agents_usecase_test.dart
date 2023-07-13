import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';
import 'package:etiya_case/feature/agent/domain/usecases/filter_agents_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentRepository mockAgentRepository;
  late FilterAgentsUsecase filterAgentsUsecase;
  late List<MockAgentEntity> mockAllAgentEntities;
  late List<MockAgentEntity> mockFilteredAgentEntities;

  late String query;

  setUp(() {
    mockAgentRepository = MockAgentRepository();
    filterAgentsUsecase = FilterAgentsUsecase(repository: mockAgentRepository);
    mockAllAgentEntities = List.generate(10, (index) => MockAgentEntity());
    mockFilteredAgentEntities = List.generate(1, (index) => MockAgentEntity());
    query = 'Gekko';
  });

  group('Filter agents use case test', () {
    test('Should return list of agent enitities length of 1 when query equals to Gekko', () {
      when(() => mockAgentRepository.filterAgents(mockAllAgentEntities, query)).thenReturn(mockFilteredAgentEntities);
      final result = filterAgentsUsecase.execute(mockAllAgentEntities, query);

      verify(() => filterAgentsUsecase.execute(mockAllAgentEntities, query));
      expect(result.length, 1);
    });
  });
}
