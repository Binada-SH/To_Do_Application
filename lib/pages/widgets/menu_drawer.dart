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
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.3,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              ListTile (
                  title: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Jura',
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w800,

                  ),
                ),
                  
                  onTap: (){},
                ),
          ],
        )
      ),
    );
  } 
}