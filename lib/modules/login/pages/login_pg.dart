import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/x_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/x_configs.dart';
import '../../../widgets/x_widgets.dart';
import '../../dashboard/x_dashboards.dart';
import '../../register/x_registers.dart';
import '../x_logins.dart';

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
          BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
            if (state is LoginLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoginValidation) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${state.value}"), backgroundColor: kRed),
              );
            }
            if (state is LoginError) {
              print('Login error');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${state.error}"), backgroundColor: kRed),
              );
            }
            if (state is LoginSuccess) {
              //simpan data ke local storage
              AuthorizationService.saveAuthData(state.result);
              //
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Welcome back. \nLogin accepted'),
                backgroundColor: Colors.green,
              ));
              context.pushReplacement(DashboardPage());
            }
            ;
          }, builder: (context, state) {
            return MyButtons.primary(context, 'Log In', () {
              // context.pushReplacement(DashboardPage());
              context.read<LoginBloc>().add(GetLogin(
                  email: emailController.text,
                  password: passwordController.text));
            });
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
