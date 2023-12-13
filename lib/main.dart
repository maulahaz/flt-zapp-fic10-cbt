import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/x_configs.dart';
import 'helpers/x_helpers.dart';
import 'modules/dashboard/x_dashboards.dart';
import 'modules/login/x_logins.dart';
import 'modules/logout/x_logouts.dart';
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
        BlocProvider(create: (context) => LogoutBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App!!',
        theme: MyThemes.lightMode,
        // darkTheme: MyThemes.darkMode,
        home: FutureBuilder<AuthorizationModel>(
            future: AuthorizationService.getAuthData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DashboardPage();
              } else {}
              return FutureBuilder<bool>(
                  future: MySessions.isAccessFirstTime(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!
                          ? LoginPage()
                          : OnboardingPage();
                    } else {}
                    return OnboardingPage();
                  });
            }),
      ),
    );
  }
}
