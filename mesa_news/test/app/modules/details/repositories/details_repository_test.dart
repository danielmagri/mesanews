import 'package:flutter_test/flutter_test.dart';
// import 'package:dio/dio.dart';

// import 'package:mesa_news/app/modules/details/repositories/details_repository.dart';

// class MockClient extends Mock implements Dio {}

void main() {
  // DetailsRepository repository;
  // MockClient client;

  setUp(() {
    // repository = DetailsRepository();
    // client = MockClient();
  });

  group('DetailsRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<DetailsRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
