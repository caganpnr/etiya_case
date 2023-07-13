part of '../view/agent_view.dart';

class _AgentCard extends StatelessWidget {
  const _AgentCard({required this.agent});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // navigate user to AgentDetailRoute
      onTap: () => context.router.push(AgentDetailRoute(agent: agent)),
      // Custom card to display agent image and name
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.defaultBorderRadius,
          // sets the background of the card
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: agent.backgroundGradientColors,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Hero(
                  tag: agent.displayName,
                  child: CustomCachedNetworkImage(
                    imageUrl: agent.fullPortrait,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ValorantText(
                  isTitle: true,
                  text: agent.displayName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
