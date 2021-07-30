import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:myarch/core/constant/image/pngimagepath.dart';

class TravelDetails extends StatefulWidget {
  TravelDetails({Key? key}) : super(key: key);

  @override
  _TravelDetailsState createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Hero(
        tag: 'Misir',
        child: Image.asset(
          PNGImagePaths.instance.travelOne,
          width: context.width,
          height: context.height*.36,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
