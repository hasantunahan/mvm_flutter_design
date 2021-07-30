import '../../../core/extension/image_extension.dart';

class PNGImagePaths {
  static PNGImagePaths? _instace;
  static PNGImagePaths get instance {
    return _instace ??= PNGImagePaths._init();
  }

  PNGImagePaths._init();

  final hotdogs = 'hotdogs'.toPNG;
  final travellogo = "travel".toPNG;
  final travelOne = "tra1".toPNG;
  final travelTwo = "tra2".toPNG;
  final travelThree = "tra3".toPNG;
  final travels = "travels".toPNG;
  final wifi = "wifi".toPNG;
  final branch = "branch".toPNG;
  final dinner = "dinner".toPNG;

}
