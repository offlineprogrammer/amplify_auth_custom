# Amplify Flutter Custom Auth sample app

This is a sample app that provides a quickstart for developers that want to build a custom Authentication flow using the Amplify Flutter library.

## Getting Started
* Install (https://docs.amplify.aws/cli/start/install/) and configure Amplify CLI
* A Flutter application targeting Flutter SDK >= 2.0.0 (stable version).
* An iOS configuration targeting at least iOS 11.0
* An Android configuration targeting at least Android API level 21 (Android 5.0) or above
* A working Amazon SES resource.


- Clone the application.

```bash
git clone https://github.com/offlineprogrammer/amplify_auth_custom.git
```

- Create your amplify environment for this app

```bash
amplify init
```

- Install dependencies

```bash
flutter pub get
```

- Update your email and region in the boilerplate-create-challenge.js file


- Build all your local backend resources and provision it in the cloud.

```bash
amplify push
```

- Run the app and try registering a new user.
