import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_auth_custom/pages/home_page.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';

import 'widgets/custom_confirm_signIn_view.dart';
import 'widgets/custom_signIn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      authenticatorBuilder: (context, state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomSignInView(state: state);
          case AuthenticatorStep.confirmSignInCustomAuth:
            return CustomConfirmSignInView(state: state);
          default:
            // returning null will default to the prebuilt authenticator for
            // all steps other than signIn and signUp
            return null;
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: Authenticator.builder(),
        home: buildApp(context),
      ),
    );
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Tried to reconfigure Amplify; '
          'this can occur when your app restarts on Android.',
        ),
      ));
    }
  }

  Widget buildApp(BuildContext context) {
    return _amplifyConfigured
        ? const HomePage()
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
