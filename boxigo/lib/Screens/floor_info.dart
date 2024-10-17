import 'package:boxigo/Models/models.dart';
import 'package:flutter/material.dart';

class FloorInfo extends StatefulWidget {
    MovingDataModel? data;
   FloorInfo( this.data,{super.key});

  @override
  State<FloorInfo> createState() => _FloorInfoState();
}

class _FloorInfoState extends State<FloorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
          child: Column(
            children: [
              Text(widget.data!.oldFloorNo.toString()),
                Text(widget.data!.oldElevatorAvailability.toString()),
                  Text(widget.data!.packingService.toString()),
                    Text(widget.data!.oldParkingDistance.toString()),
                    Text(widget.data!.old_house_additional_info.toString())
            ],
          ),
          ),
            Container(
          child: Column(
            children: [
               Text(widget.data!.newFloorNo.toString()),
                Text(widget.data!.newElevatorAvailability.toString()),
                  Text(widget.data!.unpackingService.toString()),
                    Text(widget.data!.newParkingDistance.toString()),
                     Text(widget.data!.new_house_additional_info.toString())
            
            ],
          ),
          ),
        ],
      ),
    );
  }
}