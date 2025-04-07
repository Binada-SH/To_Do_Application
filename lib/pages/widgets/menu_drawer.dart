import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
                ),
                child: Text (
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
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