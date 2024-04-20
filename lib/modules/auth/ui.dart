import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isMobileEnabled = true;
  TextEditingController t = TextEditingController();
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
                      'Hello Again!',
                      style: TextStyle(
                        fontFamily: 'TextaAltMedium',
                        fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    Container(
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          'Welcome back You\'ve \n       been missed!',
                          style: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 28,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // boxShadow: boxShadow(),
                        color: const Color.fromARGB(255, 38, 42, 47),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextFormField(
                        // controller: text.
                        style: const TextStyle(
                          fontFamily: 'TextaAltMedium',
                          fontSize: 16,
                          fontWeight: FontWeight.w200
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: (isMobileEnabled) ? "Mobile Number" : " Email ID",
                          hintStyle: const TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),
                          border: InputBorder.none
          
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // boxShadow: boxShadow(),
                        color: const Color.fromARGB(255, 38, 42, 47),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextFormField(
                        // controller: text.
                        style: const TextStyle(
                          fontFamily: 'TextaAltMedium',
                          fontSize: 16,
                          fontWeight: FontWeight.w200
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: ()=> setState(() => isMobileEnabled = !isMobileEnabled),
                          child: Text(
                            (isMobileEnabled) ? 'Login With Email' : 'Login With Mobile',
                            style: const TextStyle(
                              fontFamily: 'TextaAltMedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w200
                            ),    
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
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
                              colors: setGradient()
                            ),
                          ),
                        ),
        
                        const SizedBox(width: 8.0,),
                        
                        const Text(
                          'Or Continue With',
                          style: TextStyle(
                            fontFamily: 'TextaAltMedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w200
                          ),  
                        ),
        
                        const SizedBox(width: 8.0,),
                        
                        Container(
                          width: 80,
                          height: 2.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: setGradient()
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 44, 48, 53), //: const Color(0xFFEFEEEE),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 45,
                          width: 45,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        const SizedBox(width: 24.0,),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color:const Color.fromARGB(255, 44, 48, 53), // : const Color(0xFFEFEEEE),
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

    List<BoxShadow> boxShadow(){
    // if (ref.watch(themesProvider) == ThemeMode.dark) {
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
    // }
    // else{
    //   return [
    //     BoxShadow(
    //       color: Colors.white.withOpacity(0.9),
    //       offset: const Offset(-7.0, -7.0),
    //       blurRadius: 15.0,
    //     ),
    //     BoxShadow(
    //       color: Colors.black.withOpacity(0.25),
    //       offset: const Offset(7.0, 7.0),
    //       blurRadius: 12.0,
    //     ),
    //   ];
    // }
  }

  List<Color> setGradient(){

    // if (ref.watch(themesProvider) == ThemeMode.dark) {
      return const [
        Color.fromARGB(255, 65, 71, 81),
        Color.fromARGB(255, 49, 53, 59),
        Color.fromARGB(255, 34, 37, 40),
      ];
  //   } else {
  //     return [
  //       Colors.white,
  //       const Color.fromARGB(255, 223, 219, 219),
  //       const Color.fromARGB(255, 183, 182, 182),
  //     ]; 
  //   }
  }
}
