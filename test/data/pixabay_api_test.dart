import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:image_search/data/pixabay_api.dart';

void main() {
  test('Pixabay 데이터를 잘 가져와야 한다.', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() ==
          '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo') {
        return Response(fakeJsonBody, 200);
      }
      return Response('error', 400);
    });

    final api = PixabayApi(client: mockClient);

    // execution
    final result = await api.fetch('iphone');

    // verify
    expect(result.first.id, 2681039);
  });
}
