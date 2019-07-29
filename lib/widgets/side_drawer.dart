import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Movies App Navigation ',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            title: Text(
              'Favourites',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              print('tapped favourites');
              Navigator.of(context).pushNamed('/favourites', arguments: {
                // you can pass in arguments
                // TODO: learn about passing arguments in
              });
            },
          ),
        ],
      ),
    );
  }
}
