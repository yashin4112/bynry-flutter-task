import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:todolist/modules/auth/provider.dart';

import '../auth/signup.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text(
          'settings',
        ),
        // leading: const Icon(Icons.settings_outlined),
      ),
      body: buildSettingsList(ref),
    );
  }
}

SettingsList buildSettingsList(WidgetRef ref) {
  return SettingsList(
    contentPadding: const EdgeInsets.all(15),
    sections: [
      SettingsSection(
        tiles: <SettingsTile>[
          SettingsTile.navigation(
            leading: const Icon(Icons.account_circle),
            title: const Text(
              'Account',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              'Edit your information, Name, Email, Mobile, Address etc.',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.language_outlined),
            title: const Text(
              'Language',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              'Change language of the system',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text(
              "Privacy Policy",
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              'How we handle any customer,client or employee information gathered in its operations',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.edit_document),
            title: const Text(
              "Terms&Conditions",
              style: TextStyle(
                  //fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              'Document governing the contractual relationship between us and our user',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.report),
            title: const Text(
              'Report Problem',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              'Describe the problem encountered by you',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            leading: const Icon(Icons.water_drop_outlined),
            title: const Text(
              'theme',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              '',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
          SettingsTile.navigation(
            onPressed: (context) {
              ref.read(loginProvider).logout();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignUpView()
                ),
              );
            },
            leading: const Icon(Icons.login_outlined),
            title: const Text(
              'logout',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            value: const Text(
              '',
              style: TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
    ],
  );
}
