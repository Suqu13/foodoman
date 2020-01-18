import 'package:foodoman/domain/producer.dart';
import 'package:foodoman/domain/product.dart';

translateDateTimeToString(DateTime dateTime) =>
    dateTime.toIso8601String().split('T')[0];

buildProductFromString(
    {String id,
    String name,
    String imageUrl,
    String allPiecesNumber,
    String weight,
    String surface,
    String height,
    String description,
    Producer producer}) {
  return Product(
      id: int.parse(id),
      name: name,
      imageUrl: imageUrl,
      allPiecesNumber: int.parse(allPiecesNumber),
      weight: double.parse(weight),
      surface: double.parse(surface),
      height: double.parse(height),
      description: description,
      producer: producer);
}
