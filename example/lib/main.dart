import 'package:example/widgets/main/core/MainViewModel.dart';
import 'package:example/widgets/main/view/MainView.dart';
import 'package:flutter/material.dart';
import 'package:lenore_ui/lenore_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lenore Demo',
      theme: LenoreAppTheme(isDark: context.watch<MainViewModel>().isDark)
          .themeData,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/MainView':
            return MaterialPageRoute(builder: (context) => const MainView());
          case '/':
            return MaterialPageRoute(builder: (context) => const MainView());
          default:
            return MaterialPageRoute(builder: (context) => const MainView());
        }
      },
    );
  }
}
