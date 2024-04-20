import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todolist/widgets/image_view_widget.dart';

import '../../widgets/gridviewwidget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool isProfessional = true;
  final formatter = DateFormat('d MMM y');
  final gasId = 'SA1234567';
  var dropdownValue = 'thismonth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawer
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              fontFamily: 'TextaAltMedium',
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        leading: const Icon(Icons.home_outlined),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView()));
            },
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.notifications_outlined),
        ],
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
          child: Column(
            children: [
              Container(
                // alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  boxShadow: boxShadow(),
                  // color: ref.watch(themesProvider) == ThemeMode.dark
                  // ? const Color.fromARGB(255, 38, 42, 47)
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 42,
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/ben10/images/3/39/Site-community-image/revision/latest?cb=20230519225245'),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  'Yash Shinde',
                                  style: TextStyle(
                                      fontFamily: 'TextaAltMedium',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              //SizedBox(height: 5,),
                              Center(
                                child: Text(
                                  showgreetings(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              // const SizedBox(height: 35,),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: const Color.fromARGB(220, 241, 241, 242),
                  color: const Color.fromARGB(255, 232, 232, 232),
                  boxShadow: boxShadow(),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageViewWidget(
                          imgUrl: 'assets/images/online_payments.svg',
                          label: 'Bills',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/online_payments.svg',
                          label: 'Disconnet',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/transfer_files.svg',
                          label: 'Transfer',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/services3.svg',
                          label: 'Services',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageViewWidget(
                          imgUrl: 'assets/images/add_post.svg',
                          label: 'Compliants',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/articles.svg',
                          label: 'Update',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/connection.svg',
                          label: 'Connection',
                        ),
                        ImageViewWidget(
                          imgUrl: 'assets/images/services3.svg',
                          label: 'Services',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  const Text(
                    'Gas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 2,
                    height: 17,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    gasId,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  DropdownButtonFormField(
                    value: dropdownValue,
                    items: const [
                      DropdownMenuItem(
                        value: 'thismonth',
                        child: Text('This Month'),
                      ),
                      DropdownMenuItem(
                        value: 'lastmonth',
                        child: Text('Last Month'),
                      ),
                    ], 
                    onChanged: (value){
                      setState(() {
                        dropdownValue = value.toString();
                      });
                    }
                  )
                ],
                
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: boxShadow(),
                    // color: ref.watch(themesProvider) == ThemeMode.dark
                    //     ? const Color.fromARGB(255, 38, 42, 47)
                    color: const Color.fromARGB(255, 232, 232, 232),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.circle_outlined, size: 48.0),
                    title: const Text(
                      'Bills',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      "${formatter.format(DateTime.now())}",
                    ),
                    trailing: const Text(
                      '48\$',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                  // isProfessional == ref.watch(isPremium)
                  //     ? const ProfessionalAccountWidget()
                  //     : const NormalAccountWidget(),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  String showgreetings() {
    if (TimeOfDay.now().hour >= 5 && TimeOfDay.now().hour <= 10) {
      return "Good Morning!";
    } else if (TimeOfDay.now().hour >= 11 && TimeOfDay.now().hour <= 15) {
      return "Good Afternoon!";
    } else if (TimeOfDay.now().hour >= 16 && TimeOfDay.now().hour <= 20) {
      return "Good Evening!";
    } else {
      return "Good Night!";
    }
  }

  Widget showGrid() {
    if (!isProfessional) {
      return GridView.count(
        crossAxisCount: 2,
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: const [
          // ImageGridViewWidget(
          //     imgurl: 'assets/images/wallet.svg', label: 'Your Wallet'),
          // ImageGridViewWidget(
          //     imgurl: 'assets/images/delivery.svg', label: 'Explore Nearby'),
        ],
      );
    } else {
      return GridView.count(
        crossAxisCount: 3,
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        crossAxisSpacing: 16,
        mainAxisSpacing: 32,
        children: [
          GestureDetector(
            onTap: () async {
              //var res = await ref.read(apiProvider).userRoute.getUserInfo();
              //print(res.data);
              // context.go('/wallet');
            },
            child: const ImageGridViewWidget(
              imgurl: 'assets/images/wallet.svg',
              label: 'Your Wallet',
            ),
          ),
          GestureDetector(
            onTap: () {
              // context.go('/marketplace');
            },
            child: const ImageGridViewWidget(
                imgurl: 'assets/images/services3.svg', label: 'Your Services'),
          ),
          GestureDetector(
            // onTap: () => context.go('/nearby'),
            child: const ImageGridViewWidget(
                imgurl: 'assets/images/delivery.svg', label: 'Explore Nearby'),
          ),
          GestureDetector(
            // onTap: () => context.go('/message'),
            child: const ImageGridViewWidget(
                imgurl: 'assets/images/message.svg', label: 'Message'),
          ),
          GestureDetector(
            // onTap: () => context.go('/message'),
            child: const ImageGridViewWidget(
                imgurl: 'assets/images/message.svg', label: 'Message'),
          ),
          GestureDetector(
            // onTap: () => context.go('/message'),
            child: const ImageGridViewWidget(
                imgurl: 'assets/images/message.svg', label: 'Message'),
          ),
        ],
      );
    }
  }

  List<BoxShadow> boxShadow() {
    // if (ThemeMode == ThemeMode.light)
    {
      // return [
      //   BoxShadow(
      //     color: Colors.white.withOpacity(0.14),
      //     offset: const Offset(-2.5, -2.5),
      //     blurRadius: 10.0,
      //   ),
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.6),
      //     offset: const Offset(6.0, 6.0),
      //     blurRadius: 8.0,
      //   ),
      // ];
    }
    //   else {
    return [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        offset: Offset(4.0, 4.0),
        blurRadius: 12.0,
      ),
    ];
    //   }
  }
}
