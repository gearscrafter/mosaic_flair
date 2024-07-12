import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

@GenerateMocks([HttpClient, HttpClientRequest, HttpClientResponse, HttpHeaders])
import 'cart_summary_test.mocks.dart';

class MockHttpOverrides extends HttpOverrides {
  final MockHttpClient mockHttpClient;

  MockHttpOverrides(this.mockHttpClient);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return mockHttpClient;
  }
}

void main() {
  final mockHttpClient = MockHttpClient();

  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides(mockHttpClient);
  });

  tearDownAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('PromotionCard displays correctly', (WidgetTester tester) async {
    final responseBody = utf8.encode(jsonEncode({'data': 'mocked response'}));

    final mockRequest = MockHttpClientRequest();
    final mockResponse = MockHttpClientResponse();
    final mockHeaders = MockHttpHeaders();

    when(mockHttpClient.getUrl(any)).thenAnswer((_) async => mockRequest);
    when(mockRequest.headers).thenReturn(mockHeaders);
    when(mockRequest.close()).thenAnswer((_) async => mockResponse);
    when(mockResponse.statusCode).thenReturn(200);
    when(mockResponse.contentLength).thenReturn(responseBody.length);
    when(mockResponse.reasonPhrase).thenReturn('OK');
    when(mockResponse.listen(any,
            onDone: anyNamed('onDone'),
            onError: anyNamed('onError'),
            cancelOnError: anyNamed('cancelOnError')))
        .thenAnswer((invocation) {
      final callback =
          invocation.positionalArguments[0] as void Function(List<int>);
      final onDone =
          invocation.namedArguments[const Symbol('onDone')] as void Function()?;
      callback(responseBody);
      if (onDone != null) {
        onDone();
      }
      return Stream<List<int>>.fromIterable([responseBody]).listen(null);
    });

    when(mockResponse.compressionState)
        .thenReturn(HttpClientResponseCompressionState.notCompressed);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PromotionCard(
            image: null,
            percentage: 20.0,
            description: 'Test Description',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('20 %'), findsOneWidget);
    expect(find.text('Obtén ahora'), findsOneWidget);
  });
}
