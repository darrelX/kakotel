import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakotel_test/core/constants/images/app_image.dart';
import 'package:kakotel_test/core/shared/widget/buttons/app_button.dart';

class OnbushAppBar extends StatefulWidget {
  const OnbushAppBar({super.key, required this.title});

  final String title;

  @override
  State<OnbushAppBar> createState() => _OnbushAppBarState();
}

class _OnbushAppBarState extends State<OnbushAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      ],
    );
  }
}
