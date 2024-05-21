import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key, required this.routesName}) : super(key: key);

  final String? routesName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Back',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('No path for $routesName'),
      ),
    );
  }
}
