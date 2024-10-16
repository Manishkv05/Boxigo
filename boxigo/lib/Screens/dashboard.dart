import 'package:boxigo/Models/models.dart';
import 'package:boxigo/servise/boxi_aoi_servise.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MovingDataList?>(
        stream: MovingDataService().fetchMovingData(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(); // Show loading indicator
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        print(snapshot.data.toString());
        // Access your MovingDataList here
        MovingDataList? dataList = snapshot.data;
        return ListView.builder(
          itemCount: dataList?.estimates?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataList!.estimates![index].estimateId ?? ''),
              subtitle: Text(dataList.estimates![index].movingFrom ?? ''),
            );
          },
        );
      } else {
        return Text('No data found');
      }
        },
      ),
    );


    
  }
}