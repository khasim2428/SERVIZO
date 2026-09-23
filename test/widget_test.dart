// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('customer can book a service and view the job', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const ServizoApp());
    expect(find.text('Welcome to Servizo'), findsOneWidget);
    expect(find.text('Servizo Customer'), findsOneWidget);
    expect(find.text('Servizo Service Man'), findsOneWidget);
    await tester.tap(find.text('Servizo Customer'));
    await tester.pumpAndSettle();
    expect(find.text('What can we help with?'), findsOneWidget);
    await tester.tap(find.text('Electrician'));
    await tester.pump();
    expect(find.text('My jobs'), findsAtLeastNWidgets(1));
    expect(find.text('Electrician'), findsOneWidget);
    expect(find.text('New request'), findsOneWidget);
    expect(find.text('Site visit charge'), findsOneWidget);
    expect(find.text('Applied when the technician visits your site'), findsOneWidget);
    expect(find.text('₹99'), findsOneWidget);
    await tester.tap(find.text('Accept technician'));
    await tester.pump();
    expect(find.text('On the way'), findsOneWidget);
  });

  testWidgets('customer can open Servizo host support', (WidgetTester tester) async {
    await tester.pumpWidget(const ServizoApp());
    await tester.tap(find.text('Servizo Customer'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pump();
    expect(find.text('Servizo Host: Shaik Khasim'), findsOneWidget);
    await tester.tap(find.text('Help & support'));
    await tester.pumpAndSettle();
    expect(find.text('We are sorry you are facing trouble with Servizo. We are here to help and will do our best to resolve your issue.'), findsOneWidget);
    expect(find.text('Shaik Khasim'), findsOneWidget);
    expect(find.text('khasimshaik05051@gmail.com'), findsOneWidget);
  });
}
