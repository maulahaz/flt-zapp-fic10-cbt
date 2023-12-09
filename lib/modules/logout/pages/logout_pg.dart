import 'package:flutter/material.dart';
// import 'package:flutter_app/extensions/x_extensions.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../login/x_logins.dart';

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
            // context.read<SignoutBloc>().add(GetSignout());
            // AuthorizationService.removeAuthData();
            // context.pushReplacement(const LoginPage());
          },
          child: const Text('Logout')),
    );
  }
}
