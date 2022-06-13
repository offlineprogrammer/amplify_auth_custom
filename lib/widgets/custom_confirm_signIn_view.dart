import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

import 'navigate_to_signIn_button.dart';

class CustomConfirmSignInView extends StatelessWidget {
  const CustomConfirmSignInView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: AuthenticatorForm(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  'images/amplify.png',
                  fit: BoxFit.cover,
                  width: 200,
                ),

                // custom challenge field
                // Field Title and Field Hint can be set within the Lambda Code.
                ConfirmSignInFormField.customChallenge(
                    title: state.publicChallengeParams['fieldTitle'],
                    hintText: state.publicChallengeParams['fieldHint']),

                // prebuilt sign up button from amplify_authenticator package
                const ConfirmSignInCustomButton(),
                const SizedBox(height: 16),
                const Divider(),

                // custom button to take the user to sign in
                NavigateToSignInButton(state: state),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
