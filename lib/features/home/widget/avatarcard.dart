import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AvatarCard extends StatelessWidget {
  final String? imageUrl;
  const AvatarCard({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingLow,
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(2,2),
            blurRadius: 10,
            color: context.colorScheme.onPrimary
          )
        ],
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl ?? ""))),
    );
  }
}
