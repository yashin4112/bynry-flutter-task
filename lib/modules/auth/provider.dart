import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/provider/login.dart';

import '../../provider/api/api.dart';
import '../../provider/database.dart';

// import '../../providers/database.dart';

final loginProvider = Provider((ref) => LoginProvider(ref));
final isOtpSentProvider = StateProvider((ref) => false);
final isMobileEnabled = StateProvider((ref) => false);
final isReferalEnabled = StateProvider((ref) => false);
final isLogin = StateProvider((ref) => false);
final isPremium = StateProvider((ref) => false);
final email = StateProvider((ref) => 'user');
final otp = StateProvider((ref) => 000);
final accessToken = StateProvider((ref) => '');


class LoginProvider {
  final Ref ref;


  LoginProvider(this.ref);

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController otpController = TextEditingController(text: '');
  TextEditingController referalController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

//   final loginState = NotifierProvider<String, bool>(() {
//   return LoginState();
// });
  // void onOtpButtonTap() async{
  //   // var res = await ref.read(apiProvider).authRoute.sendOTP(email: emailController.text,mobile: mobileController.text,referral: referalController.text);
  //   ref.read(isOtpSentProvider.notifier).state = true;
  // }

  void changeOtpState() => ref.read(isOtpSentProvider.notifier).state = false;

  void verifyOtp () async {
    var res = await ref.read(apiProvider).authRoute.verifyOTP(otp: int.parse(otpController.text),email: emailController.text);
    if(res.statusCode == 200){
      // Navigator.of(context).push(MaterialPageRoute(builder: ()=> HomeScreen()));
      Fluttertoast.showToast(
        msg: 'OTP verified successfully',
        toastLength: Toast.LENGTH_SHORT,
      );
      otpController.clear();
    }
  }

  void registerUser() async {
    print(emailController.text);
    print(passwordController.text);
    print(nameController.text);
      var res = await ref.read(apiProvider).authRoute.register(email: emailController.text, password: passwordController.text, name: nameController.text);
      ref.read(isOtpSentProvider.notifier).state = true;
      Fluttertoast.showToast(msg: 'OTP sent to your email');
    // var res = await ref.read(apiProvider).authRoute.verifyOTP(otp: int.parse(otpController.text),email: emailController.text,mobile: mobileController.text,referral: referalController.text);
    // ref.read(databaseProvider).putPref('accessToken', res.data['data']['jwt']);
    // ref.read(isPremium.notifier).state = res.data['data']['isPro'];
    ref.read(email.notifier).state = res.data['email'];
    ref.read(otp.notifier).state = res.data['otp'];
    // print(res.data);
  }

  Future<void> loginUser() async {
    var res = await ref.read(apiProvider).authRoute.login(email: emailController.text, password: passwordController.text);
    ref.read(isLogin.notifier).state = true;
    ref.read(accessToken.notifier).state = res.data['access'];

    // ref.read(loginStateProvider.notifier).changeLoginState(true);
    await ref.read(databaseProvider).putPref('loginState', true);

    emailController.clear();
    passwordController.clear();
    print(res);
    Fluttertoast.showToast(msg: 'Logged in successfully');
  }
  
  void logout() async {
    await ref.read(databaseProvider).putPref('loginState', false);
    // ref.read(loginStateProvider.notifier).changeLoginState(false);
    emailController.clear();
    passwordController.clear();
    ref.read(isLogin.notifier).state = false;
    ref.read(accessToken.notifier).state = '';
    Fluttertoast.showToast(msg: 'Logged out successfully');
  }

  void setReferalMode() => ref.read(isReferalEnabled.notifier).state = !ref.read(isReferalEnabled.notifier).state;

  void setLoginMode() => ref.read(isMobileEnabled.notifier).state = true;

}