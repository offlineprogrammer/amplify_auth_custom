import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

import 'navigate_to_signUp_button.dart';

class CustomSignInView extends StatelessWidget {
  const CustomSignInView({
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

                SignInFormField.username(),

                // Un-comment the line below for Secure Remote Password (SRP) experince
                //SignInFormField.password(),

                // prebuilt sign up button from amplify_authenticator package
                const SignInButton(),

                const SizedBox(height: 16),
                const Divider(),

                // custom button to take the user to sign in
                NavigateToSignUpButton(state: state),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
