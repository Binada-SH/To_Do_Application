import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFCDE8E5),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 43, left: 40),
                  child: Text (
                    'Menu',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              ListTile (
                  title: Text('Home'),
                  onTap: (){},
                ),
          ],
        )
      ),
    );
  } 
}