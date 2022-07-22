import 'package:flutter/foundation.dart';
import 'package:zuzoon/database/communityDb.dart';
import 'package:zuzoon/model/Community_data.dart';

class communityProvider with ChangeNotifier {
  List<Community_data> community_data = [];

  List<Community_data> getData() {
    return community_data;
  }

  void addCommuData(Community_data statment) async {
    var db = community_Db(dmName: 'community.db');
    //save data
    await db.insertData(statment);

    //load data
    // community_data = await db.loadAllData();
    
    //noti consumer
    notifyListeners();
  }
}
