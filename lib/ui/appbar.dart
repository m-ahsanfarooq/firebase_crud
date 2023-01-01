import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String sectionName;

  const CustomAppBar({required this.sectionName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          'https://miro.medium.com/max/300/1*R4c8lHBHuH5qyqOtZb3h-w.png',
          height: 20,
        ),
        const SizedBox(width: 8),
        const Text(
          'Flutter Fire',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 18,
          ),
        ),
        Text(
          sectionName,
          style: const TextStyle(color: Colors.orangeAccent, fontSize: 18),
        )
      ],
    );
  }
}
