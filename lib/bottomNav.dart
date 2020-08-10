import 'package:flutter/material.dart';

import 'homePage.dart';
import 'safety.dart';
import 'settings.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentTab = 1; // sets the initial active tab

  final List<Widget> screens = [
    HomePage(),
    CustomInfoMenu(),
    CustomLocateMenu(),
  ]; // to store nested tabs

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomePage(); // Our initial view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            CustomLocateMenu(); // if user taps on location icon this page will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_searching,
                          color: currentTab == 0 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Safety',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomePage(); // if user taps on home icon this page will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 1 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            CustomInfoMenu(); // if user taps on info icon this page will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 2 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'settings',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
//_getCustomAppBar(){
//  return PreferredSize(
//    preferredSize: Size.fromHeight(50),
//    child: Container(
//      alignment: Alignment.bottomCenter,
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//
//          begin: Alignment.topLeft,
//          end: Alignment(3.0, 1.0),
//          colors: [
//            Colors.green,
//            Colors.teal,
//          ],
//        ),
//      ),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//       // IconButton(icon: Icon(Icons.menu), onPressed: (){}),
//        Text('Safe Travel Ke', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
//      //  IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
//      ],),
//    ),
//  );
//}
