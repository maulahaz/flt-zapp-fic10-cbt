import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/extensions/x_extensions.dart';

import '../../login/x_logins.dart';
import '../../register/x_registers.dart';
import '../x_logouts.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({
    super.key,
  });

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<LogoutBloc>().add(GetLogout());
            AuthorizationService.removeAuthData();
            context.pushReplacement(LoginPage());
          },
          child: const Text('Logout')),
    );
  }
}
