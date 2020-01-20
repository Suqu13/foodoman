import 'dart:math';

import 'package:foodoman/domain/product_set.dart';
import 'package:foodoman/domain/rack.dart';
import 'package:foodoman/domain/sector.dart';

import '../products_sets_service.dart';

final firstSector = Sector(
    id: 1,
    number: 10,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.');

final secondSector = Sector(
    id: 2,
    number: 22,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.');

final firstRack = Rack(
    id: 1,
    number: 10,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.',
    sector: firstSector);

final secondRack = Rack(
    id: 2,
    number: 111,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.',
    sector: firstSector);

final thirdRack = Rack(
    id: 1,
    number: 10,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.',
    sector: firstSector);

final fourthRack = Rack(
    id: 1,
    number: 10,
    description: 'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
        'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
        'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
        'non augue. Morbi tincidunt.',
    sector: firstSector);

final productsSets = [
  ProductSet(
      id: 0,
      pieces: 800,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      expiryDate: DateTime.now(),
      rack: firstRack),
  ProductSet(
      id: 2,
      pieces: 222,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      expiryDate: DateTime.now(),
      rack: secondRack),
  ProductSet(
      id: 3,
      pieces: 333,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada nec.',
      expiryDate: DateTime.now(),
      rack: thirdRack),
  ProductSet(
      id: 4,
      pieces: 444,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      expiryDate: DateTime.now(),
      rack: fourthRack),
  ProductSet(
      id: 5,
      pieces: 555,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      expiryDate: DateTime.now(),
      rack: secondRack),
  ProductSet(
      id: 6,
      pieces: 666,
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      expiryDate: DateTime.now(),
      rack: thirdRack)
];

class DummyProductsSetsServiceImpl extends ProductsSetsService {
  static const PRODUCERS_URL = "/products_sets";

  Future<List<ProductSet>> fetchAllProductsSets() async {
    return Future(() => productsSets);
  }

  Future<List<ProductSet>> fetchAllProductsSetsByProductIdAndPriorityId(
      int productId, int priorityId) async {
    final random = Random();
    return Future(() => productsSets
        .where((productSet) => productSet.pieces > random.nextInt(1000))
        .toList());
  }

  Future<List<ProductSet>> fetchAllProductsSetsByProductId(int id) async {
    final random = Random();
    return Future(() => productsSets
        .where((productSet) => productSet.pieces > random.nextInt(1000))
        .toList());
  }
}
