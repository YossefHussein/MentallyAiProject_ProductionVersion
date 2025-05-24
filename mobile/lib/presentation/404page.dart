import 'package:flutter/material.dart';

class NoFoundRoute404Screen extends StatelessWidget {
  const NoFoundRoute404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[200],
      body: Center(
        child: Text(
          'No Found Route 404',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.red,
              ),
        ),
      ),
    );
  }
}
