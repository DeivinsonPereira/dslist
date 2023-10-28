import 'package:dslist/core/app_colors.dart';
import 'package:dslist/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dslist',
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(primary: AppColors.primary),
      ),
      home: HomePage(),
    );
  }
}
