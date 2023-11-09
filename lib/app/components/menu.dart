import 'package:flutter/material.dart';

import 'package:trabalho_final_desenv_mobile/app/views/index.dart';
import 'package:trabalho_final_desenv_mobile/app/views/parking_spot/parking_spot_listing_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          ListTile(
            title: const Text('Parking Spot'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ParkingSpotListingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}