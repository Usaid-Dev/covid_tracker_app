import 'dart:convert';

import 'package:covid_tracker_app/Model/world_states_model.dart';
import 'package:covid_tracker_app/Services/Utilities/app_url.dart';
import 'package:covid_tracker_app/View/world_states.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
