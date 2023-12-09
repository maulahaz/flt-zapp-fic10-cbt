import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/extensions/x_extensions.dart';

import '../../../configs/x_configs.dart';
import '../../../widgets/x_widgets.dart';
import '../../dashboard/x_dashboards.dart';
import '../../login/x_logins.dart';
import '../x_registers.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //--controller for text field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppPrimary,
        title: Text('Register'),
      ),
      // body: Center(
      //   child: Text('Test'),
      // ),
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          MyTextField(
            controller: nameController,
            label: 'Fullname',
          ),
          SizedBox(height: 16.0),
          MyTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          // SizedBox(height: 16.0),
          // MyTextField(
          //   controller: phoneController,
          //   label: 'Phone Number',
          // ),
          SizedBox(height: 16.0),
          MyTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          MyTextField(
            controller: confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true,
          ),
          SizedBox(height: 24.0),
          BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
            if (state is SignupLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SignupValidation) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("${state.value}"), backgroundColor: kRed),
              );
            }
            if (state is SignupLoaded) {
              // AuthLocalDatasource().saveAuthData(state);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('New User Successfully Registered'),
                backgroundColor: Colors.green,
              ));
              context.pushReplacement(DashboardPage());
            }
            ;
          }, builder: (context, state) {
            return MyButtons.primary(context, 'Register', () {
              // Map<String, dynamic> dataRequest = {
              //   'fullname': nameController.text,
              //   'email': emailController.text,
              //   'phoneNumber': phoneController.text,
              //   'password': passwordController.text,
              // };
              context.read<SignupBloc>().add(GetSignup(
                    fullname: nameController.text,
                    email: emailController.text,
                    // phoneNumber: phoneController.text,
                    password: passwordController.text,
                  ));
            });
          }),
          SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              context.pushReplacement(LoginPage());
            },
            child: Text.rich(
              TextSpan(
                text: 'Already have an account?? ',
                children: [
                  TextSpan(
                    text: 'Sign in',
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
