import 'package:flutter/material.dart';

import '../components/menu.dart';

class Index extends StatelessWidget {
  const Index( {super.key} );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        title: const Text('Projeto Final Desenv. Mobile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Seja Bem-Vindo!',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Image(image: AssetImage('assets/images/doge_image.png'))
          ],
        ),
      ),
    );
  }
}