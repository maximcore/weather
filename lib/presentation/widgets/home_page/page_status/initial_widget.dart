import 'package:flutter/material.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final localization;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(localization.status.initializing),
        ],
      ),
    );
  }
}