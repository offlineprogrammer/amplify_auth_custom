import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class NavigateToSignInButton extends StatelessWidget {
  const NavigateToSignInButton({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        // abort sign in is called to make sure that the current auth flow is cancelled.
        onPressed: state.abortSignIn,
        child: const Text('Cancel Sign In'),
      ),
    );
  }
}
