import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// import '../../providers/database.dart';

final loginProvider = Provider((ref) => LoginProvider(ref));
final isOtpSentProvider = StateProvider((ref) => false);
final isMobileEnabled = StateProvider((ref) => false);
final isReferalEnabled = StateProvider((ref) => false);
final isLogin = StateProvider((ref) => false);
final isPremium = StateProvider((ref) => false);
final email = StateProvider((ref) => 'user');


class LoginProvider {
  final Ref ref;

  LoginProvider(this.ref);

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController otpController = TextEditingController(text: '');
  TextEditingController referalController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');

  // void onOtpButtonTap() async{
  //   // var res = await ref.read(apiProvider).authRoute.sendOTP(email: emailController.text,mobile: mobileController.text,referral: referalController.text);
  //   ref.read(isOtpSentProvider.notifier).state = true;
  // }

  // void verifyOtp() async {
  //   // var res = await ref.read(apiProvider).authRoute.verifyOTP(otp: int.parse(otpController.text),email: emailController.text,mobile: mobileController.text,referral: referalController.text);
  //   ref.read(databaseProvider).putPref('accessToken', res.data['data']['jwt']);
  //   ref.read(isPremium.notifier).state = res.data['data']['isPro'];
  //   ref.read(isLogin.notifier).state = true;
  //   ref.read(email.notifier).state = res.data['data']['email'];
  //   print(res.data);
  // }
  
  void setReferalMode() => ref.read(isReferalEnabled.notifier).state = !ref.read(isReferalEnabled.notifier).state;

  void setLoginMode() => ref.read(isMobileEnabled.notifier).state = true;

}