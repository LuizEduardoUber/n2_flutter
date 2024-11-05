import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:n2_flutter/main.dart'; // Altere para o caminho correto do seu arquivo main.dart

void main() {
  testWidgets('Adiciona e lista medicações', (WidgetTester tester) async {
    // Construa o aplicativo e acione um frame.
    await tester.pumpWidget(MyApp());

    // Verifique se o AppBar com o título está presente.
    expect(find.text('Controle de Medicações'), findsOneWidget);

    // Verifique se o botão de adicionar medicações está presente.
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Toque no botão de adicionar medicações.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Aguarde a navegação para a nova página.

    // Verifique se o título da página de adicionar medicações está presente.
    expect(find.text('Adicionar Medicação'), findsOneWidget);

    // Insira o nome da medicação, uso e dosagem.
    await tester.enterText(find.byType(TextField).at(0), 'Paracetamol');
    await tester.enterText(find.byType(TextField).at(1), 'Para dor de cabeça');
    await tester.enterText(find.byType(TextField).at(2), '500mg');

    // Toque no botão para adicionar a medicação.
    await tester.tap(find.text('Adicionar'));
    await tester.pumpAndSettle(); // Aguarde a navegação de volta à página inicial.

    // Verifique se a medicação foi adicionada à lista.
    expect(find.text('Paracetamol'), findsOneWidget);
    expect(find.text('Uso: Para dor de cabeça'), findsOneWidget); // Verifica uso na listagem.
    expect(find.text('500mg'), findsNothing); // Não verifica a dosagem na lista.
  });
}
