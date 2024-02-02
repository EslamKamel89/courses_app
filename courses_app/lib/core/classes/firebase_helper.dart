import 'package:courses_app/core/extension/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FbAuth {
  String? info;

  /// ==> The method returns true if the user is loged in
  ///
  /// ==> Events are fired when the following occurs:
  ///
  /// Right after the listener has been registered.
  ///
  /// When a user is signed in.
  ///
  /// When the current user is signed out.
  ///
  /// ==> https://firebase.google.com/docs/auth/flutter/manage-users
  ///
  /// ==> https://firebase.google.com/docs/auth/flutter/start
  bool isSignedIn() {
    info = '';
    'isSignedIn - FbAuth'.prt;
    if (FirebaseAuth.instance.currentUser == null) {
      info = 'User is currently signed out!'.pr;
      return false;
    } else {
      info = 'User is signed in!'.pr;
      return true;
    }
  }

  /// Create a password-based account
  ///
  /// returns true if the new account is created successfuly
  ///
  /// Typically, you would do this from your app's sign-up screen. When a new user
  /// signs up using your app's sign-up form, complete any new account validation
  /// steps that your app requires, such as verifying that the new account's password
  /// was correctly typed and meets your complexity requirements.
  ///
  /// If the new account was created successfully, the user is also signed in.
  /// If you are listening to changes in authentication state, a new event will
  /// be sent to your listeners.
  ///
  /// https://firebase.google.com/docs/auth/flutter/password-auth
  Future<bool> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    'createUserWithEmailAndPassword - FbAuth'.prt;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      info = 'New user is created successfully'.pr;
      return true;
    } on FirebaseAuthException catch (e) {
      'Error caught by try and catch block'.pr;
      if (e.code == 'weak-password') {
        info = 'The password provided is too weak.'.pr;
      } else if (e.code == 'email-already-in-use') {
        info = 'The account already exists for that email.'.pr;
      }
      info = e.code.pr;
      return false;
    } catch (e) {
      'Error caught by try and catch block'.pr;
      info = '$e'.pr;
      return false;
    }
  }

  /// UserCredential is the return type for FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'email', password: 'password');
  ///
  /// so you should use this code after the signup process
  void updateUsername({required UserCredential credential, required String username}) async {
    if (credential.user != null) {
      await credential.user!.updateDisplayName(username);
    }
  }

  /// UserCredential is the return type for FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'email', password: 'password');
  ///
  /// so you should use this code after the signup process
  void sendEmailVerificationAfterSignup({required UserCredential credential}) async {
    if (credential.user != null) {
      credential.user!.sendEmailVerification();
    }
  }

  /// Sign in a user with an email address and password
  ///
  /// The steps for signing in a user with a password are similar to the steps for creating a
  /// new account. From your your app's sign-in screen, call signInWithEmailAndPassword()
  ///
  /// this function returns true if sign in succeded & perform the sign in process
  ///
  /// https://firebase.google.com/docs/auth/flutter/password-auth
  Future<bool> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    'signInWithEmailAndPassword - FbAuth'.prt;
    bool isValidUser = false;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      isValidUser = true;
      info = 'Signed in successfully'.pr;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        info = 'No user found for that email.'.pr;
      } else if (e.code == 'wrong-password') {
        info = 'Wrong password provided for that user.'.pr;
      } else {
        info = 'Wrong Email or Password'.pr;
      }
    }
    return isValidUser;
  }

  /// sign out from normal email account
  /// sign out from google account
  Future<void> signOut() async {
    'signOut - fbAuth'.prt;
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
//there is asynchronus gap errer
/* GoogleSignInApi.disconnect (c:\Users\LORD TRADE\AppData\Local\Pub\Cache\hosted\pub.dev\google_sign_in_android-6.1.20\lib\src\messages.g.dart:299)
<asynchronous gap> (Unknown Source:0)
GoogleSignIn._callMethod (c:\Users\LORD TRADE\AppData\Local\Pub\Cache\hosted\pub.dev\google_sign_in-6.1.6\lib\google_sign_in.dart:278)
<asynchronous gap> (Unknown Source:0) */
// i solved this issue by checking if user is looged in with google
    if ((await googleSignIn.isSignedIn()) == true) {
      googleSignIn.disconnect();
      info = 'google user is signing out'.pr;
      return;
    }
    info = 'normal user is signing out'.pr;
  }

  /// Send a user a verification email
  ///
  /// https://firebase.google.com/docs/auth/flutter/manage-users
  void sendEmailVerification() {
    'sendEmailVerification - FbAuth'.prt;
/* Send a user a verification email
You can send an address verification email to a user with the sendEmailVerification()
You can customize the email template that is used in Authentication section of the Firebase console, on the Email Templates p age. See Email Templates in Firebase Help Center.
It is also possible to pass state via a continue URL to redirect back to the app when sending a verification email.
Additionally you can localize the verification email by updating the language code on the Auth instance before sending the em ail. For example:
await FirebaseAuth.instance.setLanguageCode("fr");
await user?.sendEmailVerification();
https://firebase.google.com/docs/auth/flutter/manage-users */
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    info = 'Email Verification Send Please check your inbox'.pr;
  }

  /// Send a password reset email
  ///
  /// if the email is not correct it won't generate any info related to this
  Future<void> sendPasswordResetEmail({required String email}) async {
    'sendPasswordResetEmail - FbAuth'.prt;
/* Send a password reset email
You can send a password reset email to a user with the sendPasswordResetEmail() method.
You can customize the email template that is used in Authentication section of the Firebase console, on the Email Templates p age. See Email Templates in Firebase Help Center.
It is also possible to pass state via a continue URL to redirect back to the app when sending a password reset email.
https://firebase.google.com/docs/auth/flutter/manage-users */
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).onError((error, stackTrace) {
        'Error ocurred : $error'.pr;
        info = 'Unable to send verification email'.pr;
      });
    } catch (e) {
      'Error ocurred : $e'.pr;
      info = 'Unable to send verification email'.pr;
    }
    info = 'Reset Email is sended successfuly to your email'.pr;
  }

  /// The users display name.
  /// Will be null if signing in anonymously or via password authentication.
  String? get getName {
    'getName - FbAuth'.prt;
    info = FirebaseAuth.instance.currentUser?.displayName.pr;
    return info;
  }

  /// The users email address. Will be null if signing in anonymously.
  String? get getEmail {
    'getEmail - FbAuth'.prt;
    info = FirebaseAuth.instance.currentUser?.email.pr;
    return info;
  }

  /// Returns the users phone number.
  /// This property will be null if the user has not signed in or been has their phone number linked.
  String? get getPhoneNumber {
    'getPhoneNumber - FbAuth'.prt;
    info = FirebaseAuth.instance.currentUser?.phoneNumber.pr;
    return info;
  }

  /// Returns whether the users email address has been verified.
  /// To send a verification email, see [sendEmailVerification].
  /// Once verified, call [reload] to ensure the latest user information is retrieved from Firebase.
  bool? get getIsEmailVerified {
    'getIsEmailVerified - FbAuth'.prt;
    bool? result = FirebaseAuth.instance.currentUser?.emailVerified;
    info = '$result'.pr;
    FirebaseAuth.instance.currentUser?.reload();
    return result;
  }

  /// The user's unique ID.
  String? get getUid {
    'getName - FbAuth'.prt;
    info = FirebaseAuth.instance.currentUser?.uid.pr;
    return info;
  }

  /// signInWithGoogle returns true if signIn Process works successfuly
  Future<bool> signInWithGoogle() async {
    'signInWithGoogle - FbAuth'.prt;
    info = '';
/* Google
Most configuration is already setup when using Google Sign-In with Firebase, however you need to ensure your machine's SHA1 key has been configured for use with Android.
https://firebase.google.com/docs/auth/flutter/federated-auth */
    try {
// Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
// if googleUser or googleAuth is null this will throw exception in the lines below
      if (googleUser == null || googleAuth == null) {
        info = 'Error happened in googleAuth'.pr;
        return false;
      }
// Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
// Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      await userCredential.user!.reload();
// bool result = userCredential.additionalUserInfo?.isNewUser ?? false;
      bool result = getIsEmailVerified ?? false;
      result ? info = 'Sign in with Google completed successfuly'.pr : info = 'Could not connect with google'.pr;
      return result;
    } catch (e) {
      'error caught by try and catch block: $e'.pr;
    }
    return false;
  }
}
