import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
 void saveBooks(List<BookEntity> book, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
   box.addAll(book);
}
