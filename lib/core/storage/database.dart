// ignore_for_file: non_constant_identifier_names

class DB {
  static String STREAM_TOKEN = "STREAM_TOKEN";
  static String PIN_SET_TOKEN = "PIN_SET_TOKEN";
  static String AUTH = "AUTH";
  static String USER = "USER";
  static String WALLET = "WALLET_";
  static String BUSINESS_WALLET = "WALLET_BUSINESS";
  static String NOTIFICATIONS = "NOTIFICATIONS";
  static String INTERESTS = "INTERESTS";
  static String PRODUCTS = "CATCHED_PRODUCTS";
  static String HOME_PRODUCTS_CATCH = "HOME_PRODUCTS_CATCH";
  static String CACHE_GIFTS = "CACHE_GIFTS";
  static String FIRST_USE = "FIRST_USE";
  static String FIRST_USE_SHOP = "FIRST_USE_SHOP";
  static String BOX_SETTINGS = "BOX_SETTINGS";
  static String BOX_MAIN_DATABASE = "BOX_MAIN_DATABASE";

  static String CART = "CART";
  static String SHOP = 'SHOP_';
}

class COLLECTION {
  static String LIVESTREAMS = "livestream";
  static String USERS = "users";
  static String conversations = "conversations";
  static String requests = "requests";
  static String STORIES = "stories";
  static String CONVOS = "conversations";
  static String MESSAGES = "messages";
  static String SETTINGS = "settings";
  static String APP_SETTINGS = "app_settings";
  static String ADMIN = "admin";
}

class SOCKETS {
  static String JOIN_STREAM = "join_stream";
  static String SEND_STREAM_LIKE = "stream_like";
  static String INITIAL_STREAM = "initial_stream";
  static String END_STREAM = "stream_close";
  static String NEW_STREAM = "stream_updated";
  static String STREAM_EVENT = "stream_event";
  static String POST_CREATED = "post_created";
}
