import 'package:flutter/material.dart';

import '../../../register/x_registers.dart';
import '../../x_dashboards.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeaderHome(),
          const SizedBox(height: 24.0),
          TitleSection(
            title: 'Beranda',
            onSeeAllTap: () {},
          ),
          const SizedBox(height: 16.0),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 24.0,
            ),
            children: [
              MenuHome(
                imagePath: 'lib/assets/images/about-us.png',
                label: 'About Us',
                onPressed: () async {
                  // context.push(const AboutUsView());
                  final authData = await AuthorizationService.getAuthData();
                  print(authData.accessToken);
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/tips.png',
                label: 'Tips & Tricks ',
                onPressed: () {
                  // context.push(const TipsAndTricksView());
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/documents.png',
                label: 'Materi',
                onPressed: () {
                  // context.push(const MateriView());
                },
              ),
              MenuHome(
                imagePath: 'lib/assets/images/quiz.png',
                label: 'Quiz',
                onPressed: () {
                  // context.push(const QuizListView());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
