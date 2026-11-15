import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/shared/widgets/chip_editor.dart';

void main() {
  const options = ['Harry Potter', 'Harry Styles', 'Fantasy'];

  Widget host({
    required ValueChanged<String> onCommit,
    bool keepEditorOpenOnSelect = false,
    String Function(String option)? displayStringForOption,
  }) => MaterialApp(
    home: Scaffold(
      body: Material(
        child: Column(
          children: [
            ChipEditor(
              initialText: '',
              suggestionsFor: (query) => options.where(
                (o) => o.toLowerCase().contains(query.toLowerCase()),
              ),
              onCommit: onCommit,
              keepEditorOpenOnSelect: keepEditorOpenOnSelect,
              displayStringForOption: displayStringForOption,
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );

  const outsideEditor = Offset(400, 500);

  String fieldText(WidgetTester tester) =>
      tester.widget<EditableText>(find.byType(EditableText)).controller.text;

  double fieldWidth(WidgetTester tester) => tester
      .getSize(
        find
            .ancestor(
              of: find.byType(TextField),
              matching: find.byType(DecoratedBox),
            )
            .first,
      )
      .width;

  testWidgets('selecting an option commits the option', (tester) async {
    String? committed;
    await tester.pumpWidget(host(onCommit: (t) => committed = t));

    await tester.enterText(find.byType(TextField), 'Harry');
    await tester.pumpAndSettle();
    expect(find.text('Harry Potter'), findsOneWidget);

    await tester.tap(find.text('Harry Potter'));
    await tester.pumpAndSettle();

    expect(committed, 'Harry Potter');
  });

  testWidgets('tapping outside commits the typed text', (tester) async {
    String? committed;
    await tester.pumpWidget(host(onCommit: (t) => committed = t));

    await tester.enterText(find.byType(TextField), 'Harry');
    await tester.pumpAndSettle();

    await tester.tapAt(outsideEditor);
    await tester.pumpAndSettle();

    expect(committed, 'Harry');
  });

  testWidgets('keepEditorOpenOnSelect keeps editing the selected option', (
    tester,
  ) async {
    String? committed;
    await tester.pumpWidget(
      host(
        onCommit: (t) => committed = t,
        keepEditorOpenOnSelect: true,
        displayStringForOption: (option) => '$option #',
      ),
    );

    await tester.enterText(find.byType(TextField), 'Harry');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Harry Potter'));
    await tester.pumpAndSettle();

    expect(committed, isNull);
    expect(fieldText(tester), 'Harry Potter #');

    await tester.enterText(find.byType(TextField), 'Harry Potter #3');
    await tester.pumpAndSettle();
    await tester.tapAt(outsideEditor);
    await tester.pumpAndSettle();

    expect(committed, 'Harry Potter #3');
  });

  testWidgets('scrolling the suggestion list keeps the editor open', (
    tester,
  ) async {
    String? committed;
    await tester.pumpWidget(host(onCommit: (t) => committed = t));

    await tester.enterText(find.byType(TextField), 'Harry');
    await tester.pumpAndSettle();
    expect(find.text('Harry Potter'), findsOneWidget);

    await tester.drag(find.text('Harry Potter'), const Offset(0, -20));
    await tester.pumpAndSettle();

    expect(committed, isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  group('field width', () {
    Widget sized(double availableWidth) => MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: availableWidth,
            child: ChipEditor(
              initialText: '',
              suggestionsFor: (_) => const [],
              onCommit: (_) {},
            ),
          ),
        ),
      ),
    );

    testWidgets('the parent caps it\'s width', (tester) async {
      await tester.pumpWidget(sized(300));
      expect(fieldWidth(tester), 300);
    });

    testWidgets('fills the row in a wrap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 500,
              child: Wrap(
                children: [
                  ChipEditor(
                    initialText: '',
                    suggestionsFor: (_) => const [],
                    onCommit: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      expect(fieldWidth(tester), 500);
    });
  });
}
