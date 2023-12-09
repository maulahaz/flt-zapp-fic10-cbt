import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/x_extensions.dart';

import '../../../configs/x_configs.dart';
import '../../../widgets/x_widgets.dart';
import '../../dashboard/x_dashboards.dart';
import '../../register/x_registers.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kAppPrimary,
        centerTitle: true,
        title: Text('Log in'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          MyTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          SizedBox(height: 16.0),
          MyTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kAppPrimary,
              ),
            ),
          ),
          SizedBox(height: 42.0),
          MyButtons.primary(context, 'Log In', () {
            context.pushReplacement(DashboardPage());
          }),
          SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              context.pushReplacement(RegisterPage());
            },
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(color: kAppPrimary),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
