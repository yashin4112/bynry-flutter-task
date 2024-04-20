import 'package:flutter/material.dart';
import 'package:todolist/modules/auth/provider.dart';

import '../../provider/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signin.dart';


class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome aboard ! ',
                      style: TextStyle(
                          fontFamily: 'TextaAltMedium',
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          'The journey begins here ',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          'Create your account !',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // boxShadow: boxShadow(),
                        // color: const Color.fromARGB(255, 38, 42, 47),
                        color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
        
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextFormField(
                        controller: ref.read(loginProvider).emailController,
                        style: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: " Email ID",
                          hintStyle: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextFormField(
                        controller: ref.read(loginProvider).nameController,
                        style: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontFamily: 'TextaAltMedium',
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextFormField(
                        controller: ref.read(loginProvider).passwordController,
                        style: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: 'TextaAltMedium',
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    !ref.watch(isOtpSentProvider)? 
                    const SizedBox() :
                     Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          // boxShadow: boxShadow(),
                          color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextFormField(
                          scrollPadding: const EdgeInsets.all(16.0),
                          controller: ref.read(loginProvider).otpController,
                          style: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: "OTP",
                            hintStyle: TextStyle(
                              fontFamily: 'TextaAltMedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w200
                            ),
                            border: InputBorder.none
          
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInView()));
                            ref.read(isOtpSentProvider.notifier).state = false;
                          },
                          child: const Text(
                            'Already have an Account Login Here',
                            style: TextStyle(
                                fontFamily: 'TextaAltMedium',
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: ref.watch(isOtpSentProvider)? (){
                          ref.read(loginProvider).verifyOtp();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInView() ));
                        } : ref.read(loginProvider).registerUser,
                        child: Text(
                          ref.watch(isOtpSentProvider) ? 'Verify OTP' : 'Register',
                          style: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 2.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: setGradient()),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text(
                          'Or Continue With',
                          style: TextStyle(
                              fontFamily: 'TextaAltMedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Container(
                          width: 80,
                          height: 2.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: setGradient()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(
                            //     255, 44, 48, 53), 
                            ////: const Color(0xFFEFEEEE),
                            color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
        
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 45,
                          width: 45,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        const SizedBox(
                          width: 24.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(
                            //     255, 44, 48, 53), // : const Color(0xFFEFEEEE),
                            color: ref.watch(themesProvider) == ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color(0xFFEFEEEE),
        
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 45,
                          width: 45,
                          child: Image.asset('assets/images/facebook.png'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<BoxShadow> boxShadow() {
    if (ref.watch(themesProvider) == ThemeMode.dark) {
    return [
      BoxShadow(
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        offset: const Offset(-5.5, -5.5),
        blurRadius: 8.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.6),
        offset: const Offset(6.0, 6.0),
        blurRadius: 6.0,
      ),
    ];
    }
    else{
      return [
        BoxShadow(
          color: Colors.white.withOpacity(0.9),
          offset: const Offset(-7.0, -7.0),
          blurRadius: 15.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(7.0, 7.0),
          blurRadius: 12.0,
        ),
      ];
    }
  }

  List<Color> setGradient() {
    if (ref.watch(themesProvider) == ThemeMode.dark) {
    return const [
      Color.fromARGB(255, 65, 71, 81),
      Color.fromARGB(255, 49, 53, 59),
      Color.fromARGB(255, 34, 37, 40),
    ];
      } else {
        return [
          Colors.white,
          const Color.fromARGB(255, 223, 219, 219),
          const Color.fromARGB(255, 183, 182, 182),
        ];
      }
  }
}