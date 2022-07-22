import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:zuzoon/model/Community_data.dart';

class community_Db {
  String? dmName;
  community_Db({
    this.dmName,
  });

  Future<Database> openDB() async {
    //find location
    var appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dmName);
    //create db
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //save data
  Future<int> insertData(Community_data satatement) async {
    //store
    var db = await this.openDB();
    var store = intMapStoreFactory.store('community');

    //json
    var keyId = store.add(db, {
      'title': satatement.c_title,
      'description': satatement.c_desciption,
    });
    db.close();
    return keyId;
  }

  // Future<List> loadAllData() async {
  //   var db = await this.openDB();
  //   var store = intMapStoreFactory.store('community');
  //   var snapshot = await store.find(db, finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
  //   List communityList = List<Community_data>.from(<List<Community_data>>[]);
  //   for (var record in snapshot) {
  //     communityList.add(
  //       Community_data(c_title: record['title'],c_desciption: record["description"],));
  //   }
  //   return communityList;
  // }
}
