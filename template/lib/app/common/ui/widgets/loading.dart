import 'package:flutter/material.dart';

import '../app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.colorPrimary,
      ),
    );
  }
}
