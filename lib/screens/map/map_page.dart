import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:ponygold/core/constant/app_colors.dart';
import 'package:ponygold/core/widgets/app_bar/app_bar_for_shor.dart';
import 'package:ponygold/core/widgets/app_text_style.dart';
import 'package:ponygold/core/widgets/blue_buttons/app_blue_button1.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];
  final MapObjectId placemarkId = const MapObjectId('normal_icon_placemark');
  Location location = Location();
  LocationData? currentPosition;

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBarForShop(
          title: "address".tr(),
        ),
      ),
      body: Stack(
        children: [
          YandexMap(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            modelsEnabled: true,
            nightModeEnabled: false,
            indoorEnabled: false,
            liteModeEnabled: false,
            mapObjects: mapObjects,
            onMapTap: (Point point) {
              marker(
                  latitude: point.latitude.toDouble(),
                  longitude: point.longitude.toDouble());
            },
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
              final cameraPosition = await controller.getCameraPosition().then(
                (value) async {
                  await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      const CameraPosition(
                          target: Point(latitude: 41.2995, longitude: 69.2401),
                          zoom: 12.0),
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.h,
                left: 15.w,
                right: 15.w,
              ),
              child: TextFormField(
                onTap: () {
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Material(
                  //     color: Colors.white,
                  //     child: Container(
                  //       height: 200.h,
                  //       color: Colors.white,
                  //       child: Column(
                  //         children: const [
                  //           ListTile(
                  //             title: Text('Home'),
                  //             subtitle: Text('more info here........'),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  fillColor: AppColors.white,
                  filled: true,
                  hintText: "Поиск...",
                  hintStyle: AppTextStyle.regular(
                    color: AppColors.blackV,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColors.blackV,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: AppColors.activeColorOfPin,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 10.w,
              ),
              height: ScreenUtil().setHeight(74),
              width: ScreenUtil().setWidth(360),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: AppBlueButton1(
                  primary: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.splashColor1,
                      AppColors.splashColor2,
                    ],
                  ),
                  onPressed: () async {
                    await controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                            latitude: currentPosition!.latitude!.toDouble(),
                            longitude: currentPosition!.longitude!.toDouble(),
                          ),
                          zoom: 16.0,
                        ),
                      ),
                    );
                    marker(
                        latitude: currentPosition!.latitude!.toDouble(),
                        longitude: currentPosition!.longitude!.toDouble());
                    print(
                        "latitude: ${currentPosition!.latitude!.toDouble()} ");
                    print(
                        "longitude: ${currentPosition!.longitude!.toDouble()} ");
                  },
                  child: Text(
                    'Подтвердить',
                    style: AppTextStyle.regular(
                      color: AppColors.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBarUI() {
    return FloatingSearchBar(
      hint: 'Поиск...',
      openAxisAlignment: 0.0,
      width: 600,
      axisAlignment: 0.0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      elevation: 0,
      physics: const BouncingScrollPhysics(),
      onQueryChanged: (query) {
        //Your methods will be here
        print(query);
        var info = findPlaces(query: query);
      },
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 400),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: const Duration(milliseconds: 300),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {
              print('Places Pressed');
            },
          ),
        ),
        // FloatingSearchBarAction.searchToClear(
        //   showIfClosed: false,
        // ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.h,
              color: Colors.white,
              child: Column(
                children: const [
                  ListTile(
                    title: Text('Home'),
                    subtitle: Text('more info here........'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentPosition = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        currentPosition = currentLocation;
      });
    });
  }

  marker({latitude, longitude}) {
    if (mapObjects.isEmpty) {
      if (mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }
      final placemark = PlacemarkMapObject(
        mapId: placemarkId,
        point: Point(latitude: latitude, longitude: longitude),
        onTap: (PlacemarkMapObject self, Point point) {
          print('Tapped me at $point');
        },
        direction: 0,
        opacity: 1,
        isDraggable: true,
        onDragStart: (_) => print('Drag start'),
        onDrag: (_, Point point) => print('Drag at point $point'),
        onDragEnd: (_) => print('Drag end'),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2.4,
            image:
                BitmapDescriptor.fromAssetImage('assets/img/location_icon.png'),
            rotationType: RotationType.noRotation)),
      );

      setState(() {
        mapObjects.add(placemark);
      });
    } else if (mapObjects.isNotEmpty) {
      if (!mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemarkUpdate = mapObjects
          .firstWhere((el) => el.mapId == placemarkId) as PlacemarkMapObject;
      setState(() {
        mapObjects[mapObjects.indexOf(placemarkUpdate)] =
            placemarkUpdate.copyWith(
          point: Point(latitude: latitude, longitude: longitude),
        );
      });
    }
  }
}

findPlaces({String? query}) async {
  final results = YandexSearch.searchByText(
      searchText: query!,
      geometry: Geometry.fromBoundingBox(const BoundingBox(
        southWest:
            Point(latitude: 55.76996383933034, longitude: 37.57483142322235),
        northEast:
            Point(latitude: 55.785322774728414, longitude: 37.590924677311705),
      )),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
        geometry: false,
        userPosition: Point(latitude: 41.311158, longitude: 69.279737),
      ));

  SearchSessionResult res = await results.result;

  return info(data: res.items);
}

info({data}) {
  List list = [];
  for (var r in data) {
    r.items.asMap().forEach((i, item) {
      list.add(i);
      print("$i");
    });
  }
  return list;
}
