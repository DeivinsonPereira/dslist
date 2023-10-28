import 'package:dslist/core/app_colors.dart';
import 'package:dslist/pages/page_home.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'dslist',
        theme: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            primary: AppColors.primary
          ),
        ),
      home: PageHome(),  
      );
  }
}