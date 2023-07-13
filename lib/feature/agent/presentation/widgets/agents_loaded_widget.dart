part of '../view/agent_view.dart';

class AgentsLoadedWidget extends StatelessWidget {
  const AgentsLoadedWidget({required this.agents, super.key});

  final List<AgentEntity> agents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefault,
      child: Column(
        children: [
          // Displaying search field to filter agents
          CupertinoSearchTextField(
            borderRadius: context.defaultBorderRadius,
            style: context.textTheme.bodyLarge,
            // calling the [AgentsSearched] event when user inputs a query
            onChanged: (query) => context.read<AgentsBloc>().add(
                  AgentsSearched(query),
                ),
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: context.mediumValue,
                crossAxisSpacing: context.mediumValue,
                childAspectRatio: 3 / 4,
                crossAxisCount: 2,
              ),
              itemCount: agents.length,
              itemBuilder: (context, index) => _AgentCard(
                agent: agents[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
