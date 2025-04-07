import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(13),
          bottomRight: Radius.circular(13)
        )
      ),
      child: Container(
        color: Color(0xFFAAE9E9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFAAE9E9),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 43, left: 40),
                  child: Text (
                    'Menu',
                    style: TextStyle(
                      fontFamily: 'Jura',
                      letterSpacing: 1.3,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              ListTile (
                leading: Icon(
                  Icons.home,
                  ),
                  title: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Jura',
                    letterSpacing: 1.3,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontFamily: 'Jura',
                    letterSpacing: 1.3,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Jura',
                    letterSpacing: 1.3,
                    fontSize: 17,
                    fontWeight: FontWeight.w900
                  ),
                ),
              )
              
          ],
        )
      ),
    );
  } 
}