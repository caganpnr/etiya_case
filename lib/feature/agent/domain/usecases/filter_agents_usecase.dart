import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/repositories/agent_repository.dart';

class FilterAgentsUsecase {
  /// Interacts with the filterAgents method of the [AgentRepository] and returns
  /// List of [AgentEntity] that match the given query
  FilterAgentsUsecase({required AgentRepository repository}) : _repository = repository;

  final AgentRepository _repository;

  /// Returns List of [AgentEntity] that match the given query
  List<AgentEntity> execute(List<AgentEntity> agents, String query) {
    return _repository.filterAgents(agents, query);
  }
}
