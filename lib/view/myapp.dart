import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksummary/repository/wrapper.dart';
import 'package:quicksummary/resources/theme_manager.dart';
import 'package:quicksummary/services/firebase_service/firebase_auth.dart';
import 'package:quicksummary/utils/loading_indicator.dart';
import 'package:quicksummary/utils/routes/routes.dart';
import 'package:quicksummary/utils/switch_button.dart';
import 'package:quicksummary/view/homepage/widgets/input_field.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
            value: AuthService().authState, initialData: null),
        ChangeNotifierProvider<Textformfield>(
            create: ((context) => Textformfield())),
        ChangeNotifierProvider<LoadingIndicator>(
            create: ((context) => LoadingIndicator())),
        ChangeNotifierProvider<SwitchBtn>(create: ((context) => SwitchBtn()))
      ],
      child: MaterialApp(
        theme: getApplicationThemeData(),
        debugShowCheckedModeBanner: false,
        home: const Wrapper(),
        onGenerateRoute: Routes.GenerateRoutes,
      ),
    );
  }
}
