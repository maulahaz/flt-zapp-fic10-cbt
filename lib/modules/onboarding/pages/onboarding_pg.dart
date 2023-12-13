import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/x_extensions.dart';

import '../../../helpers/x_helpers.dart';
import '../../../widgets/x_widgets.dart';
import '../../login/x_logins.dart';
import '../x_onboardings.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: 'lib/assets/images/screen1.png',
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
    OnboardingModel(
      image: 'lib/assets/images/screen2.png',
      text: 'Onboarding Screen-2 !',
    ),
    OnboardingModel(
      image: 'lib/assets/images/screen3.png',
      text: 'Onboarding Screen-3 !',
    ),
  ];

  void navigate() {
    context.pushReplacement(LoginPage());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/ornament.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              SkipButton(onPressed: navigate),
              OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData,
              ),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: MyButtons.primary(context, 'Continue', () {
                  if (currentPage < onboardingData.length - 1) {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    currentPage++;
                    setState(() {});
                  } else {
                    MySessions.saveAccessFirstTime();
                    navigate();
                  }
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
