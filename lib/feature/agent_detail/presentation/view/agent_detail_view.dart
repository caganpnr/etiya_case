import 'package:auto_route/auto_route.dart';
import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/product/widgets/image/custom_network_image.dart';
import 'package:etiya_case/product/widgets/text/valorant_text.dart';
import 'package:flutter/material.dart';

part '../widgets/agent_abilities.dart';
part '../widgets/stacked_agent_image.dart';

@RoutePage()
class AgentDetailView extends StatelessWidget {
  const AgentDetailView({required this.agent, super.key});

  final AgentEntity agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackedAgentImage(agent: agent),
            Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.description,
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  const ValorantText(
                    isTitle: true,
                    text: 'Abilities',
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  AgentAbilities(agent: agent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
