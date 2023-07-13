import 'package:etiya_case/locator.dart';
import 'package:etiya_case/product/router/product_router.dart';
import 'package:etiya_case/product/theme/product_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // initialize getIt
  initServices();
  runApp(EtiyaCase());
}

class EtiyaCase extends StatelessWidget {
  EtiyaCase({super.key});

  final _productRouter = ProductRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // theme
      theme: ProductTheme().theme,

      // routing
      routerDelegate: _productRouter.delegate(),
      routeInformationParser: _productRouter.defaultRouteParser(),
    );
  }
}
