import 'package:flutter/material.dart';

class ImageOptionWidget extends StatelessWidget {
  const ImageOptionWidget({super.key, this.onPressed, required this.icon, required this.text});
  final VoidCallback? onPressed;
  final Widget icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: icon
          ),
          const SizedBox(height: 5,),
          Text(text, style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}