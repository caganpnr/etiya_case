part of 'agents_bloc.dart';

//Used abstract final to limit it from extending and implemeting from other files
abstract final class AgentsEvent extends Equatable {
  const AgentsEvent();

  @override
  List<Object> get props => [];
}

final class AgentsFetched extends AgentsEvent {
  @override
  List<Object> get props => [];
}

final class AgentsSearched extends AgentsEvent {
  const AgentsSearched(this.query);

  final String query;
  @override
  List<Object> get props => [query];
}
