import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:myarch/core/base/view/base_widget.dart';
import 'package:myarch/core/constant/image/pngimagepath.dart';
import 'package:myarch/core/constant/navigationconstant.dart';
import 'package:myarch/core/init/navigation/navigation_service.dart';
import 'package:myarch/features/home/viewmodel/homeviewmodel.dart';
import 'package:myarch/features/home/widget/avatarcard.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: buildAppBar(context),
        body: Padding(
          padding: context.horizontalPaddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildResultsTExt(context),
              buildTravelAvatarList(value),
              buildTravelName(context),
              buildFacilities(context),
              buildFacilitiesList(value),
              buildTravelGuide(context),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

   buildTravelGuide(BuildContext context) {
    return Container(
              margin: context.verticalPaddingLow,
              padding: context.paddingLow,
              decoration: BoxDecoration(
                  color: context.colorScheme.surface.withOpacity(0.24),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: context.colorScheme.surface,
                    ),
                    Text(
                      "Travels Guide",
                      style: context.textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.surface),
                    ),
                  ],
                ),
              ),
            );
  }

  buildFacilitiesList(HomeViewModel value) {
    return Flexible(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: value.facilitiesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: context.width * .2,
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1,
                        color: Color(value.facilitiesList[index].color ?? 0))),
                child: Column(
                  children: [
                    Expanded(
                        child: Image.asset(
                            value.facilitiesList[index].icon.toString())),
                    AutoSizeText(
                      value.facilitiesList[index].name.toString(),
                      style: context.textTheme.bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }

  Padding buildFacilities(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText("Facilities",
              style: context.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child: Text(
                "See More",
                style: context.textTheme.bodyText1
                    ?.copyWith(color: context.colorScheme.surface),
              ))
        ],
      ),
    );
  }

  buildTravelName(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigationService.instance.navigateToPage(path: NavigationConstants.TRAVEL_DETAIL,data: "");
      },
      child: Hero(
        tag: 'Misir',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                color: context.colorScheme.primaryVariant,
                boxShadow: [BoxShadow(offset: Offset(1, 1))]),
            child: Column(
              children: [
                buildTravelNameImage(context),
                buildTravelNameText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTravelNameText(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "6000₺",
                style: context.textTheme.bodyText2?.copyWith(
                    fontFamily: 'Poppins',
                    color: context.colorScheme.error,
                    fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                "TravelID : 352352515",
                style: context.textTheme.bodyText2?.copyWith(
                    fontFamily: 'Poppins',
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              AutoSizeText("Mısır Piramitleri")
            ],
          ),
          CircleAvatar(
            backgroundColor: context.colorScheme.onPrimary,
            maxRadius: 30,
          )
        ],
      ),
    );
  }

  buildTravelNameImage(BuildContext context) {
    return Container(
      width: context.width,
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          PNGImagePaths.instance.travelOne,
        ),
      )),
      child: Column(
        children: [
          Padding(
            padding: context.paddingLow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Mısır Piramitleri",
                  style: context.textTheme.headline6?.copyWith(
                      fontFamily: 'Poppins',
                      color: context.colorScheme.background),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildResultsTExt(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: AutoSizeText(
        "150 Results",
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onPrimary),
      ),
    );
  }

  buildTravelAvatarList(HomeViewModel value) {
    return Observer(builder: (_) {
      return Flexible(
        flex: 1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.avatarList.length,
          itemBuilder: (context, index) {
            return buildImageCard(context, value, index);
          },
        ),
      );
    });
  }

  buildImageCard(BuildContext context, HomeViewModel value, int index) {
    return AvatarCard(
      imageUrl: value.avatarList[index].image.toString(),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Travels For You",
        style: context.textTheme.headline6!
            .copyWith(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
      ),
      actions: [buildAppBarActionButton(context)],
    );
  }

  buildAppBarActionButton(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: context.horizontalPaddingLow,
          child: GestureDetector(
            onTap: () => {},
            child: Icon(Icons.edit, color: context.colorScheme.onPrimary),
          ),
        ),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: GestureDetector(
            onTap: () => {},
            child: Icon(Icons.search, color: context.colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
