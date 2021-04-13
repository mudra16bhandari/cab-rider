import 'dart:async';
import 'package:cab_rider/brand_colors.dart';
import 'package:cab_rider/widgets/BrandDivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'dart:io';

class MainPage extends StatefulWidget {

  static const String id = "mainpage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  double searchSheetHeight = (Platform.isIOS) ? 300 : 265;

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  double mapBottomPadding = 0;


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
              mapController = controller;
              setState(() {
                mapBottomPadding = (Platform.isAndroid) ? 260 : 270;
              });
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: searchSheetHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius:15.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7,0.7),
                  )
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.5,),
                    Text('Nice to see you!', style: TextStyle(fontSize: 10),),
                    Text('Where are you going?', style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(
                              0.7,0.7
                            ),
                        ),
                      ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.blueAccent,),
                            SizedBox(width: 10),
                            Text('Search Destination'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 22,),
                    Row(
                      children: [
                        Icon(OMIcons.home, color: BrandColors.colorDimText,),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Home',),
                            SizedBox(height: 3,),
                            Text('Your residential address', style: TextStyle(fontSize: 11, color: BrandColors.colorDimText,))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    BrandDivider(),
                    SizedBox(height: 16,),

                    Row(
                      children: [
                        Icon(OMIcons.workOutline, color: BrandColors.colorDimText,),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Work',),
                            SizedBox(height: 3,),
                            Text('Your office address', style: TextStyle(fontSize: 11, color: BrandColors.colorDimText,))
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
