import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    required this.size,
    required this.iconSize,
    required this.onPressed,
    super.key,
  });

  final double size;
  final double iconSize;
  final Null Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(
            Icons.search,
            size: iconSize,
            color: const Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}
