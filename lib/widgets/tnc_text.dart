import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: RichText(
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "By clicking continue, you agree to our ",
              style: TextStyle(color: Colors.grey)),
          TextSpan(
            text: "Terms of Use ",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Terms and Condition');
              },
          ),
          TextSpan(text: "and ", style: TextStyle(color: Colors.grey)),
          TextSpan(
              text: "acknowledge that you have read our ",
              style: TextStyle(color: Colors.grey)),
          TextSpan(
            text: "Privace Policy.",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Privacy Policy');
              },
          ),
        ]),
      ),
    );
  }
}
