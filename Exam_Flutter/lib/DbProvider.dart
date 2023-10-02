//
//
// class DbProvider {
//   DbProvider();
//
//   static final DbProvider db = DbProvider();
//
//   static Database? _database;
//
//   Future<Database?> get database async {
//     if (_database == null) {
//       _database == await initDb();
//     }
//     return _database;
//   }
//
//   Future<Database> initDb() async {
//     Directory appDirectory = await getApplicationCacheDirectory();
//     String dbPath = appDirectory.path + 'T2019e_flutter.db';
//     print('dbPath :${dbPath}');
//     return await openDatabase(
//         dbPath,
//         version: 1,
//         onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//           await db.execute('create table IF NOT EXISTS splash ('
//               'id integer primary key,'
//               'title text,'
//               'content text,'
//               'image text,'
//               'status bit)'
//           );
//         }
//
//     );
//   }
// }
class Place {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}