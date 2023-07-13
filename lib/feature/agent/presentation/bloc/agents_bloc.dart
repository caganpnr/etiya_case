import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/domain/usecases/filter_agents_usecase.dart';
import 'package:etiya_case/feature/agent/domain/usecases/get_agents_usecase.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'agents_event.dart';
part 'agents_state.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  AgentsBloc({required GetAgentsUsecase getAgents, required FilterAgentsUsecase filterAgents})
      : _getAgents = getAgents,
        _filterAgents = filterAgents,
        super(AgentsInitial()) {
    on<AgentsFetched>(_onAgentsFetched);
    on<AgentsSearched>(_onAgentsSearched);
  }

  final GetAgentsUsecase _getAgents;
  final FilterAgentsUsecase _filterAgents;

  /// Interacts with the [GetAgentsUsecase] and depending on the result emits new state
  Future<void> _onAgentsFetched(AgentsFetched event, Emitter<AgentsState> emit) async {
    emit(AgentsLoading());
    final response = await _getAgents.execute();

    response.fold(
      // emit new state [AgentsFailure] in case of a left type of object
      (failure) => emit(AgentsFailure(failure)),
      // emit new state [AgentsLoaded] in case of a right type of object
      (success) => emit(AgentsLoaded(agents: success, filteredAgents: success)),
    );
  }

  /// Interacts with the [FilterAgentsUsecase] and updates filteredAgents variable in the [AgentsLoaded] state
  Future<void> _onAgentsSearched(AgentsSearched event, Emitter<AgentsState> emit) async {
    final state = this.state;
    if (state is AgentsLoaded) {
      final filteredAgents = _filterAgents.execute(state.agents, event.query);
      // emit new state with the filtered agents
      emit(state.copyWith(filteredAgents: filteredAgents));
    }
  }
}
