import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Foodoman App', () {
    final productsMainMenuButtonFinder = find.byValueKey('products');
    final productTileFinder = find.byValueKey('0');
    final primaryFloatingButton = find.byValueKey('primaryFloatingButton');
    final editSecondaryFloatingButtonFinder =
        find.byValueKey('editSecondaryFloatingButton');
    final nameTextFieldFormFinder = find.byValueKey('nameCustomFieldForm');
    final customTextFieldsFormListFinder =
        find.byValueKey('customTextFieldsFormList');
    final saveCustomButtonFinder = find.byValueKey('saveCustomButton');
    final backButtonFinder = find.byTooltip('Back');
    final productsDetailsNameFinder = find.byValueKey('productsDetailsName');
    final customDropdownButtonFinder =
        find.byValueKey('producerCustomDropdownButton');
    final customDropdownButtonItemFinder = find.byValueKey('2');
    final producerNameFinder = find.byValueKey('producerName');
    final producerDetailsListViewFinder =
        find.byValueKey('producerDetailsListView');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('navigate to details edition', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(productsMainMenuButtonFinder);
        await driver.waitFor(productTileFinder);
        await driver.tap(productTileFinder);
        await driver.tap(primaryFloatingButton);
        await driver.tap(editSecondaryFloatingButtonFinder);
      });
    });

    test('provide valid new name and check if exists', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(nameTextFieldFormFinder);
        await driver.enterText('Nowa JEDEN');
        await driver.scrollUntilVisible(
            customTextFieldsFormListFinder, saveCustomButtonFinder,
            dyScroll: -300.0);
        await driver.tap(saveCustomButtonFinder);
        await driver.tap(backButtonFinder);
        expect(await driver.getText(productsDetailsNameFinder), 'Nowa JEDEN');
      });
    });

    test('navigate again to details edition', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(primaryFloatingButton);
        await driver.tap(editSecondaryFloatingButtonFinder);
      });
    });

    test('provide invalid new name and check if old name exist', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(nameTextFieldFormFinder);
        await driver.enterText('');
        await driver.scrollUntilVisible(
            customTextFieldsFormListFinder, saveCustomButtonFinder,
            dyScroll: -300.0);
        await driver.tap(saveCustomButtonFinder);
        await driver.tap(backButtonFinder);
        expect(await driver.getText(productsDetailsNameFinder), 'Nowa JEDEN');
      });
    });

    test('navigate second time to details edition', () async {
      await driver.runUnsynchronized(() async {
        await driver.tap(primaryFloatingButton);
        await driver.tap(editSecondaryFloatingButtonFinder);
      });
    });

    test('provide producer', () async {
      await driver.scrollUntilVisible(
          customTextFieldsFormListFinder, saveCustomButtonFinder,
          dyScroll: -300.0);
      await driver.tap(customDropdownButtonFinder);
      await driver.tap(customDropdownButtonItemFinder);
      await driver.waitFor(saveCustomButtonFinder);
      await driver.tap(saveCustomButtonFinder);
      await driver.tap(backButtonFinder);
    });

    test('check if producer changed and navigate to main menu', () async {
      await driver.runUnsynchronized(() async {
        await driver.scrollUntilVisible(
            producerDetailsListViewFinder, producerNameFinder,
            dyScroll: -300.0);
        expect(
            await driver.getText(producerNameFinder), 'The Coca-Cola Company');
        await driver.tap(backButtonFinder);
        await driver.tap(backButtonFinder);
      });
    });
  });
}
