import 'package:ebook/ui/book_signup.dart';
import 'package:ebook/utils/routes/routes.dart';
import 'package:ebook/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.registerScreen),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
