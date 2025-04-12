import 'package:flutter/material.dart';

class menuDrawer extends StatelessWidget {
  const menuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(13),
          bottomRight: Radius.circular(13),
        ),
      ),
      child: Container(
        color: const Color(0xFFCDE8E5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 20, 
                    child: Icon(
                      Icons.person),
                    backgroundColor: Color.fromARGB(255, 160, 165, 167),
                    foregroundColor: Colors.black87,
                    
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name', 
                    style: TextStyle(
                      fontFamily: 'Jura',
                      letterSpacing: 1.3,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'user@example.com', 
                    style: TextStyle(
                      fontFamily: 'Jura',
                      letterSpacing: 0.8,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 126, 126, 126),
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.black87,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: 'Jura',
                        letterSpacing: 1.3,
                        fontSize: 17,
                        fontWeight: FontWeight.w700, 
                        color: Colors.black87,
                      ),
                    ),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings, 
                      color: Colors.black87,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        fontFamily: 'Jura',
                        letterSpacing: 1.3,
                        fontSize: 17,
                        fontWeight: FontWeight.w700, 
                        color: Colors.black87,
                      ),
                    ),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person, 
                      color: Colors.black87,
                    ),
                    title: Text(
                      'Account',
                      style: TextStyle(
                        fontFamily: 'Jura',
                        letterSpacing: 1.3,
                        fontSize: 17,
                        fontWeight: FontWeight.w700, 
                        color: Colors.black87,
                      ),
                    ),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.timeline,
                      color: Colors.black87,
                    ),
                    title: Text(
                      'Focus',
                      style: TextStyle(
                        fontFamily: 'Jura',
                        letterSpacing: 1.3,
                        fontSize: 17,
                        fontWeight: FontWeight.w700, 
                        color: Colors.black87,
                      ),
                    ),
                    onTap: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}