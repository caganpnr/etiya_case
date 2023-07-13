part of 'agents_bloc.dart';

/// Used sealed classes to exhaustively match all of its sub classes in the switch statements
sealed class AgentsState extends Equatable {
  const AgentsState();

  @override
  List<Object> get props => [];
}

final class AgentsInitial extends AgentsState {
  @override
  List<Object> get props => [];
}

final class AgentsLoading extends AgentsState {
  @override
  List<Object> get props => [];
}

class AgentsLoaded extends AgentsState {
  const AgentsLoaded({
    this.agents = const <AgentEntity>[],
    this.filteredAgents = const <AgentEntity>[],
  });

  final List<AgentEntity> agents;
  final List<AgentEntity> filteredAgents;

  @override
  List<Object> get props => [agents, filteredAgents];

  AgentsLoaded copyWith({
    List<AgentEntity>? agents,
    List<AgentEntity>? filteredAgents,
  }) {
    return AgentsLoaded(
      agents: agents ?? this.agents,
      filteredAgents: filteredAgents ?? this.filteredAgents,
    );
  }
}

final class AgentsFailure extends AgentsState {
  const AgentsFailure(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [failure];
}
