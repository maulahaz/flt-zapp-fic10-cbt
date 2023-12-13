import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/x_configs.dart';
import 'modules/login/x_logins.dart';
import 'modules/onboarding/x_onboardings.dart';
import 'modules/register/x_registers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App!!',
          theme: MyThemes.lightMode,
          // darkTheme: MyThemes.darkMode,
          home: OnboardingPage(),
        ),
    );
  }
}
