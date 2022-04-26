import 'package:boxoniq/screens/Wallet.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/screens/mybundalSubscription.dart';
import 'package:boxoniq/screens/myorderpage.dart';
import 'package:boxoniq/screens/mysublist.dart';
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
    Mysublist(),
    WallatePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onBack() {
    return check();
  }

  check() {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Are you sure"),
              content: Text('Are you sure to quit?'),
              actions: <Widget>[
                FlatButton(
                  child: Text("Stay", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Quit", style: TextStyle(color: Colors.blue))),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
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
      ),
    );
  }
}
