// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:etiya_case/feature/agent/domain/entities/agent/agent_entity.dart'
    as _i4;
import 'package:etiya_case/feature/agent/presentation/view/agent_view.dart'
    as _i1;
import 'package:etiya_case/feature/agent_detail/presentation/view/agent_detail_view.dart'
    as _i2;
import 'package:flutter/material.dart' as _i5;

abstract class $ProductRouter extends _i3.RootStackRouter {
  $ProductRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AgentRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AgentView(),
      );
    },
    AgentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AgentDetailView(
          agent: args.agent,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AgentView]
class AgentRoute extends _i3.PageRouteInfo<void> {
  const AgentRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AgentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgentRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AgentDetailView]
class AgentDetailRoute extends _i3.PageRouteInfo<AgentDetailRouteArgs> {
  AgentDetailRoute({
    required _i4.AgentEntity agent,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AgentDetailRoute.name,
          args: AgentDetailRouteArgs(
            agent: agent,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AgentDetailRoute';

  static const _i3.PageInfo<AgentDetailRouteArgs> page =
      _i3.PageInfo<AgentDetailRouteArgs>(name);
}

class AgentDetailRouteArgs {
  const AgentDetailRouteArgs({
    required this.agent,
    this.key,
  });

  final _i4.AgentEntity agent;

  final _i5.Key? key;

  @override
  String toString() {
    return 'AgentDetailRouteArgs{agent: $agent, key: $key}';
  }
}
