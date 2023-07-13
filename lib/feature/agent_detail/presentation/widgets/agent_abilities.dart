part of '../view/agent_detail_view.dart';

class AgentAbilities extends StatelessWidget {
  const AgentAbilities({required this.agent, super.key});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: agent.abilities.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final ability = agent.abilities[index];
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: context.highValue,
                child: CustomCachedNetworkImage(
                  imageUrl: ability.displayIcon,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ability.displayName.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.lowValue,
                  ),
                  Text(
                    ability.description,
                    style: TextStyle(color: context.theme.disabledColor),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
