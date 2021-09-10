class DatabaseServices {
  DatabaseServices._();

  static final DatabaseServices _instance = DatabaseServices._();

  static DatabaseServices get service => _instance;

  initialize() async {}
}
