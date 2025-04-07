import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Set the drawer to be 70% of the screen height or any other value you prefer
    final drawerHeight = screenHeight * 0.31;
    
    return SizedBox(
      height: drawerHeight, // Adjust this value as needed
      child: Drawer(
        width: 200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(13),
            bottomRight: Radius.circular(13)
          )
        ),
        child: Container(
          color: const Color(0xFFAAE9E9),
          child: Column(
            children: [
              Container(
                color: const Color(0xFFAAE9E9),
                padding: const EdgeInsets.only(top: 15, left: 60, bottom: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    fontFamily: 'Jura',
                    letterSpacing: 1.3,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 120,
                  height: 1.5,
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    ListTile(
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
                      onTap: null,
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
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.timeline),
                      title: Text(
                        'Focus',
                        style: TextStyle(
                          fontFamily: 'Jura',
                          letterSpacing: 1.3,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}