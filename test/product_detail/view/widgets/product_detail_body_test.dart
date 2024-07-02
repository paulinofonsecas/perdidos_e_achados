// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/global/product_detail/product_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductDetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ProductDetailBloc(),
          child: MaterialApp(home: ProductDetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
