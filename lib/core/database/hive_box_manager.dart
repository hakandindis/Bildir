import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveBoxManager<T> {
  final String key;
  Box<T>? box;

  IHiveBoxManager(this.key) {
    //init();
    box = Hive.box<T>(key);
  }

  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {}
  }

  Future<void> clearBox() async {
    await box?.clear();
  }

  void addItem(T model);
  void deleteItem(int index);
  void updateItem(T model, int index);

  T? readItem(int index);

  //List<T>? getValues();
}


/*
class NoteModelManager extends IHiveBoxManager<NoteModel> {
  NoteModelManager(String key) : super(key);

  @override
  void addItem(NoteModel noteModel) {
    _box!.add(noteModel);
  }

  @override
  void deleteItem(int index) {
    _box!.deleteAt(index);
  }

  @override
  NoteModel? readItem(int index) {
    _box!.getAt(index);
  }

  @override
  void updateItem(NoteModel noteModel, int index) {
    _box!.putAt(index, noteModel);
  }
}
*/