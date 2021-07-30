import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:myarch/core/base/model/base_view_model.dart';
import 'package:myarch/core/constant/image/image_constatns.dart';
import 'package:myarch/core/constant/image/pngimagepath.dart';
import 'package:myarch/core/extension/image_extension.dart';
import 'package:myarch/features/home/model/facilitiesmodel.dart';
import 'package:myarch/features/home/model/travelmodel.dart';
part 'homeviewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @observable
  List<TravelAvatarModel> avatarList = [];

  @observable
  List<FacilitiesModel> facilitiesList = [];

  @override
  void init() {
    addAvatarList();
    addFacilitiesList();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  addAvatarList() {
    avatarList.add(
      TravelAvatarModel(id: 1, image: PNGImagePaths.instance.travelOne),
    );
    avatarList.add(
      TravelAvatarModel(id: 2, image: PNGImagePaths.instance.travelTwo),
    );
    avatarList.add(
      TravelAvatarModel(id: 3, image: PNGImagePaths.instance.travelThree),
    );
    avatarList.add(
      TravelAvatarModel(id: 4, image: PNGImagePaths.instance.travelOne),
    );
    avatarList.add(
      TravelAvatarModel(id: 5, image: PNGImagePaths.instance.travelTwo),
    );
    avatarList.add(
      TravelAvatarModel(id: 6, image: PNGImagePaths.instance.travelThree),
    );
  }

  void addFacilitiesList() {
    facilitiesList.add(FacilitiesModel(
        id: 1,
        icon: PNGImagePaths.instance.travels,
        color: int.parse('0XFF91ffb2'),
        name: "Travel"));
    facilitiesList.add(FacilitiesModel(
        id: 2,
        icon: PNGImagePaths.instance.wifi,
        color: int.parse('0XFFb5dfff'),
        name: "Wifi"));
    facilitiesList.add(FacilitiesModel(
        id: 3,
        icon: PNGImagePaths.instance.branch,
        color: int.parse('0XFFd747ff'),
        name: "Branch"));
    facilitiesList.add(FacilitiesModel(
        id: 4,
        icon: PNGImagePaths.instance.dinner,
        color: int.parse('0XFFff4747'),
        name: "Dinner"));
  }
}
