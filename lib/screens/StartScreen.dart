import 'package:boxoniq/screens/Wallet.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/screens/myorderpage.dart';
import 'package:boxoniq/screens/search.dart';
import 'package:boxoniq/screens/subscription.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

int selectedIndex = 0;

class _NavState extends State<Nav> {
  List<Widget> _widgetOptions = <Widget>[
    HomeScrren(),
    SearchPage(),
    MyOrderPage(),
    SubscriptionPage(),
    WallatePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        elevation: 0,
        backgroundColor: lightWhite2,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 8),
        unselectedLabelStyle: TextStyle(fontSize: 8),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // backgroundColor: primaryLight,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'My Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        // fixedColor: Colors.orange,
      ),
    );
  }
}
