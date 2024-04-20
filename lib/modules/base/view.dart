import 'package:flutter/material.dart';
import 'package:todolist/modules/profile/ui.dart';

import '../auth/signup.dart';
import '../home/ui.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          const HomeView(),
          Container(),
          Container(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.data_usage_outlined,
            ),
            selectedIcon: Icon(
              Icons.data_usage,
            ),
            label: 'Usage',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.support_agent_outlined,
            ),
            selectedIcon: Icon(
              Icons.support_agent,
            ),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
            ),
            selectedIcon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
