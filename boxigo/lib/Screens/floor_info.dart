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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    height: 50,
                    width: double.infinity,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text("Existing House Details",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                     ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Floor No ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                        Text(widget.data!.oldFloorNo.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                             Text('Elevator Available',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                          Text(widget.data!.oldElevatorAvailability.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                      Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                               Text('Packing Required ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                            Text(widget.data!.packingService.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                        Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                 Text('Distance from door to truck ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                              Text(widget.data!.oldParkingDistance.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.44),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 Text('Additional Information ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                              Text(widget.data!.old_house_additional_info!=""?widget.data!.old_house_additional_info.toString():"No additional info",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                ],
              ),
              ),
            ),
              Container(
            child: Column(
              children: [
                  Container(color: Colors.grey.shade300,
                  height: 50,
                  width: double.infinity,
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Text("New House Details",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                   ),),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        Text('Floor No ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                       Text(widget.data!.newFloorNo.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text('Elevator Available ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                        Text(widget.data!.newElevatorAvailability.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text('Unpacking Required ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                          Text(widget.data!.unpackingService.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Text('Distance from door to truck ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                            Text(widget.data!.newParkingDistance.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                       Padding(
                         padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*0.44),
                         child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              Text('Additional Information ',style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                             Text(widget.data!.new_house_additional_info!=""?widget.data!.new_house_additional_info.toString():"No Additional Info",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                           ],
                         ),
                       )
              
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}