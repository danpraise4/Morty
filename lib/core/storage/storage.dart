import 'package:morty/core/storage/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box mainStorage;
late Box settingsStorage;

initStorage() async {
  await Hive.initFlutter();
  mainStorage = await Hive.openBox(DB.BOX_MAIN_DATABASE);
  settingsStorage = await Hive.openBox(DB.BOX_SETTINGS);
}

getStorage({required String path, temp}) {
  if (temp != null) {
    return mainStorage.get(path, defaultValue: temp);
  }
  return mainStorage.get(path);
}

setStorage({required String key, required value}) {
  return mainStorage.put(key, value);
}

getSettings({required String path}) {
  return settingsStorage.get(path);
}

setSettings({required String key, required value}) {
  return settingsStorage.put(key, value);
}

clearData(List<String> keys) async {
  return await mainStorage.deleteAll(keys);
}

deleteKey(List<String> keys) {
  for (String key in keys) {
    mainStorage.delete(key);
  }
}
