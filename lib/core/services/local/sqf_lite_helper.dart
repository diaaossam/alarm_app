class SqfLiteHelper{
  static const String databaseName = "recommendation.db";
  static const int databaseVersion = 1;
  static const String tableName = "recommendationTable";

  static const String id = "id";
  static const String itemName = "itemName";
  static const String itemCategory = "itemCategory";
  static const String date = "date";


  static const String createDatabaseQuery =
      'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $itemName TEXT, $itemCategory TEXT, $date Text )';
}