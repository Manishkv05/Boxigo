import 'dart:async';
import 'package:boxigo/Models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovingDataService {
  final String apiUrl = "http://test.api.boxigo.in/sample-data/";

Stream<MovingDataList?> fetchMovingData() async* {
  // while (true) {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Decode the JSON as a map
        Map<String, dynamic> json = jsonDecode(response.body);
        // Pass the map to the MovingDataList model
        yield MovingDataList.fromJson(json);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
      yield null; // Emit null on error
    

    // await Future.delayed(Duration(seconds: 10)); // Optional: Delay before fetching again
  }
}


}
