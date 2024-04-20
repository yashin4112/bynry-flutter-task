import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/base/view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          textTheme: Typography().black.apply(fontFamily: 'TextaAltMedium'),         
        ),
      // darkTheme: ThemeData.dark(
      //   useMaterial3: true,
      // ).copyWith(
      //     textTheme: Typography().white.apply(fontFamily: 'TextaAltMedium'),         
      //   ),
      home: const BaseView(),
    );
  }
}