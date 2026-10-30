import 'package:curie_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('welcome opens the main navigation', (tester) async {
    await tester.pumpWidget(const CurieApp());
    expect(find.text('CURIE'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    expect(find.textContaining('cientista'), findsOneWidget);
  });

  testWidgets('mission completion awards points only once', (tester) async {
    await tester.pumpWidget(const CurieApp());
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.assignment_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('ao nosso redor'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.textContaining('Iniciar'));
    await tester.tap(find.textContaining('Iniciar'));
    await tester.pumpAndSettle();
    expect(find.text('Leitura simulada'), findsOneWidget);
    await tester.drag(find.byType(ListView).last, const Offset(0, -500));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('completeMissionButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.emoji_events_outlined));
    await tester.pumpAndSettle();
    expect(find.text('30 pontos'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.assignment_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('ao nosso redor'));
    await tester.pumpAndSettle();
    expect(find.textContaining('adicionados novamente.'), findsOneWidget);
    expect(find.textContaining('Concluir'), findsNothing);
  });

  testWidgets('observation form validates and confirms a record', (
    tester,
  ) async {
    await tester.pumpWidget(const CurieApp());
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.edit_note));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Validar registro'));
    await tester.pumpAndSettle();
    expect(find.text('Informe ao menos 3 caracteres.'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Amostra de solo');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'Comparei observacoes do experimento educativo.',
    );
    await tester.tap(find.text('Validar registro'));
    await tester.pumpAndSettle();
    expect(find.text('Registro validado!'), findsOneWidget);
  });
  testWidgets('map and Marie tabs show the demo content', (tester) async {
    await tester.pumpWidget(const CurieApp());
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mapa').last);
    await tester.pumpAndSettle();
    expect(find.text('Registros demonstrativos'), findsOneWidget);
    await tester.tap(find.text('Marie').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('respostas locais'), findsOneWidget);
    await tester.tap(find.textContaining('radia'));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView).last, const Offset(0, -600));
    await tester.pumpAndSettle();
    expect(find.textContaining('energia que se propaga'), findsOneWidget);
  });
}
