import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() async {
  test('Stream이 잘 동작해야한다.', () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/ge92fad5a79ae09e0212eda443cb137c7f4b4857baf4be4939139e67d228ad20213ec1a8534c862b5a66d898b4fbd1b36_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g1bde0f09ae7efae226cdfcff1fa5afafea6b118fc6ee3c9c1796933e6a61cf662dc21c3c0d5ef267df5cd4820af3ebbbb9935d43a73b212565f9b2bbf0329006_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 419171,
    "downloads": 242319,
    "collections": 1227,
    "likes": 2309,
    "comments": 182,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g82ada800615ad50ae0da833345d56f1ac246f5d0bbc59cbb51aea6c2598d524b1b3732b6acedd4c11387cd6ad21999d362b6b121695676838c687e30a3f18288_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gf434a30d341c5441ccdb44984543aa3fefc44104e0033569e6287eb1b476c96ec70147e2775636f3a62e42c738e75a2eb082ed9b599120078c94b8d885621e04_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 600402,
    "downloads": 440210,
    "collections": 1305,
    "likes": 964,
    "comments": 258,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
