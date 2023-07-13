import 'package:auto_route/auto_route.dart';
import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart';
import 'package:etiya_case/feature/agent/presentation/bloc/agents_bloc.dart';
import 'package:etiya_case/locator.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:etiya_case/product/router/product_router.gr.dart';
import 'package:etiya_case/product/widgets/animation/custom_loading_animation.dart';
import 'package:etiya_case/product/widgets/button/retry_button.dart';
import 'package:etiya_case/product/widgets/image/custom_network_image.dart';
import 'package:etiya_case/product/widgets/text/custom_error_text.dart';
import 'package:etiya_case/product/widgets/text/valorant_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/agent_card.dart';
part '../widgets/agents_failure_widget.dart';
part '../widgets/agents_loaded_widget.dart';

@RoutePage()
class AgentView extends StatelessWidget {
  const AgentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ValorantText(text: 'Agents', isTitle: true),
      ),
      // Injecting the [AgentsBloc] instance to the widget tree
      body: BlocProvider(
        create: (context) => getIt<AgentsBloc>()..add(AgentsFetched()),
        child: const AgentViewBody(),
      ),
    );
  }
}

class AgentViewBody extends StatelessWidget {
  const AgentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsBloc, AgentsState>(
      builder: (context, state) {
        // Displays widgets accoring to [AgentsState]
        return switch (state) {
          AgentsInitial() => const Center(
              child: CustomLoadingAnimation(),
            ),
          AgentsLoading() => const Center(
              child: CustomLoadingAnimation(),
            ),
          AgentsLoaded() => AgentsLoadedWidget(
              agents: state.filteredAgents,
            ),
          AgentsFailure() => Center(
              child: AgentsFailureWidget(
                failure: state.failure,
                onPressed: () => context.read<AgentsBloc>()..add(AgentsFetched()),
              ),
            ),
        };
      },
    );
  }
}
