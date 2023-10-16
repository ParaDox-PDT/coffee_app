import 'package:paradoxs_coffee/data/models/product/product_model_for_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("coffee.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${ProductModelFields.tableName} (
    ${ProductModelFields.id} $idType,
    ${ProductModelFields.productId} $intType,
    ${ProductModelFields.price} $intType,
    ${ProductModelFields.count} $intType,
    ${ProductModelFields.name} $textType,
    ${ProductModelFields.photoUrl} $textType,
    ${ProductModelFields.categoryId} $textType,
    ${ProductModelFields.description} $textType
    );
    ''');

    await db.execute('''
    CREATE TABLE ${ProductModelFields.favorites} (
    ${ProductModelFields.id} $idType,
    ${ProductModelFields.productId} $intType,
    ${ProductModelFields.price} $intType,
    ${ProductModelFields.count} $intType,
    ${ProductModelFields.name} $textType,
    ${ProductModelFields.photoUrl} $textType,
    ${ProductModelFields.categoryId} $textType,
    ${ProductModelFields.description} $textType
    );
    ''');
  }

  //-------------------Cart Products------------------------

  static Future<ProductModelForSql> insertProduct(
      ProductModelForSql productModelForSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductModelFields.tableName, productModelForSql.toJson());
    return productModelForSql.copyWith(id: id);
  }

  static Future<List<ProductModelForSql>> getAllProducts() async {
    List<ProductModelForSql> allProducts = [];
    final db = await getInstance.database;
    allProducts = (await db.query(ProductModelFields.tableName))
        .map((e) => ProductModelForSql.fromJson(e))
        .toList();
    return allProducts;
  }

  static Future<bool> checkProduct({required int id})async{
    final db = await getInstance.database;
    List<Map<String, dynamic>> result = await db.query(
      ProductModelFields.tableName,
      where: '${ProductModelFields.productId} = ? ',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }

  static incrementProduct({required int id}) async {
    final db = await getInstance.database;
    await db.execute(
        "UPDATE ${ProductModelFields.tableName} SET ${ProductModelFields.count} = ${ProductModelFields.count} + 1 WHERE ${ProductModelFields.productId} = $id;");
  }

  static decrementProduct({required int id}) async {
    final db = await getInstance.database;
    await db.execute(
        "UPDATE ${ProductModelFields.tableName} SET ${ProductModelFields.count} = ${ProductModelFields.count} - 1 WHERE ${ProductModelFields.productId} = $id;");
  }

  static deleteProduct(int id) async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.tableName,
      where: "${ProductModelFields.productId} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllProducts() async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.tableName,
    );
  }

  //------------------------Favorites Product--------------------------

  static Future<ProductModelForSql> insertProductToFavorites(
      ProductModelForSql productModelForSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductModelFields.favorites, productModelForSql.toJson());
    return productModelForSql.copyWith(id: id);
  }

  static Future<List<ProductModelForSql>> getAllFavorites() async {
    List<ProductModelForSql> allProducts = [];
    final db = await getInstance.database;
    allProducts = (await db.query(ProductModelFields.favorites))
        .map((e) => ProductModelForSql.fromJson(e))
        .toList();
    return allProducts;
  }

  static Future<List<String>> getAllFavoritesId() async {
    List<String> allID = [];
    final db = await getInstance.database;
    allID = (await db.query(ProductModelFields.favorites))
        .map((e) => ProductModelForSql.fromJson(e).productId.toString())
        .toList();
    return allID;
  }

  static deleteProductFromFavorites(int id) async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.favorites,
      where: "${ProductModelFields.productId} = ?",
      whereArgs: [id],
    );
  }

}
