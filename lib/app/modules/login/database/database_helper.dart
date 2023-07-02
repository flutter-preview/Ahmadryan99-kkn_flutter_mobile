import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  int id;
  String email;
  String password;

  User({required this.id, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class DatabaseHelper {
  late Database _database;

  Future<void> initDatabase() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'my_app.db');
    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            email TEXT,
            password TEXT
          )
        ''');

        // Menambahkan pengguna ke dalam tabel users
        List<User> users = [
          User(id: 1, email: '1234', password: '1234'),
          User(id: 2, email: '1111', password: '1111'),
          User(id: 3, email: '2222', password: '2222'),
        ];

        for (User user in users) {
          await db.insert('users', user.toMap());
        }
      },
    );
  }

  Future<User?> getUserByEmailAndPassword(String email, String password) async {
    List<Map<String, dynamic>> maps = await _database.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }

    return null;
  }
}
