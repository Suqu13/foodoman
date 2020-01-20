import 'package:foodoman/domain/producer.dart';

import '../producers_service.dart';

final producers = [
  Producer(
      id: 0,
      name: 'First Producer',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.'),
  Producer(
      id: 1,
      name: 'Second Producer',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.'),
  Producer(
      id: 2,
      name: 'Third Producer',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.'),
  Producer(
      id: 3,
      name: 'Fourth Producer',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.')
];

class DummyProducersServiceImpl extends ProducersService {
  Future<List<Producer>> fetchAllProducers() async {
    return Future(() => producers);
  }
}
