import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 10)();
  TextColumn get name => text().withLength(min: 1, max: 30)();
  TextColumn get email => text().withLength(min: 5, max: 30)();
  TextColumn get phone => text().withLength(min: 1, max: 11)();
  BoolColumn get status => boolean().withDefault(Constant(true))();
}

@UseMoor(tables: [Users])
class UserDB extends _$UserDB {
  UserDB()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<User>> getUsers() => select(users).get();
  Stream<List<User>> watchUsers() => select(users).watch();
  Future insertUser(User user) => into(users).insert(user);
  Future updateUser(User user) => update(users).replace(user);
  Future deleteUser(User user) => delete(users).delete(user);
}
