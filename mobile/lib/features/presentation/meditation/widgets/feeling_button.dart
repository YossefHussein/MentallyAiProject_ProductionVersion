import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// this is feeling button is used by the user
// to know the feeling
// ignore: must_be_immutable
class FeelingButton extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  final VoidCallback? onTap;
  Color? borderColor;

  FeelingButton({
    super.key,
    required this.label,
    required this.image,
    required this.color,
    required this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor ?? color),
              color: color,
            ),
            child: Image(
              image: AssetImage(
                image,
              ),
              height: 25,
            ),
          ),
          AutoSizeText(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
