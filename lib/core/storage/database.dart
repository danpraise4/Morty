// ignore_for_file: non_constant_identifier_names

class DB {
  static String FIRST_USE = "FIRST_USE";
  static String BOX_SETTINGS = "BOX_SETTINGS";
  static String BOX_MAIN_DATABASE = "BOX_MAIN_DATABASE";
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
