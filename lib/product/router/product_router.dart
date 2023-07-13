import 'package:auto_route/auto_route.dart';
import 'package:etiya_case/product/router/product_router.gr.dart';

// renames view with route
@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Router instance
class ProductRouter extends $ProductRouter {
  // declaring routes
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(initial: true, page: AgentRoute.page),
        AdaptiveRoute(page: AgentDetailRoute.page),
      ];
}
