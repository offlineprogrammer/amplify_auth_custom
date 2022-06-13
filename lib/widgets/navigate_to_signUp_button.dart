import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class NavigateToSignUpButton extends StatelessWidget {
  const NavigateToSignUpButton({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () => state.changeStep(
            AuthenticatorStep.signUp,
          ),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
