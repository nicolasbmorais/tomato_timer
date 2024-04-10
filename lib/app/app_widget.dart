import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/l10n/l10n.dart';

/// O App é o módulo principal da aplicação
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1,
            minScaleFactor: 0.5,
            child: child ?? Container(),
          ),
        );
      },
      routerConfig: Modular.routerConfig,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

/// Classe para desabilitar o efeito de scroll
class MyBehavior extends ScrollBehavior {
  /// Construtor padrão
  Widget buildMyBehavior(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
