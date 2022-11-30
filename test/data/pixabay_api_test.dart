import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';

void main() {
  test('Pixabay 데이터를 잘 가져와야 한다.', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() ==
          '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo') {
        return Response(fakeJsonBody, 200);
      }
      return Response('error', 400);
    });

    final api = PhotoApiRepositoryImpl(PixabayApi(mockClient));

    // execution
    final Result<List<Photo>> result = await api.fetch('iphone');

    // verify
    expect((result as Success<List<Photo>>).data.first.id, 2681039);
  });
}

String fakeJsonBody = """
{"total":8649,"totalHits":500,"hits":[{"id":2681039,"pageURL":"https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/","type":"photo","tags":"phone wallpaper, watercolor, painting","previewURL":"https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g2897276b55392a1763754c2d37841c1a01c920fc017af378bdbc5d03a4115139684ca2b65a5a6baa6f1cd73d57fbf8153eb59b845834250c2ce6d52abac51cbc_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/ga42610102a3ec8ae7ad7bce59ce1cc5047a96c16ecd3e7ba2bd695664fd923fa9993b43919be84e6d01c8c928878b9581bd3911e1baaabaf0489dc9d1b2ad875_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":5021313,"views":949330,"downloads":730433,"collections":1842,"likes":1164,"comments":121,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":1599527,"pageURL":"https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/","type":"photo","tags":"phone wallpaper, mystery, island","previewURL":"https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg","previewWidth":116,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g53b78487ec07e9984d4b3ef0d5920af6ed578771b9e93f1571739e353c0065e564e410e29f0746bfddd242f80454c55195ffe948b390b34fe07f56d5ffdd83f3_640.jpg","webformatWidth":495,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gd3ebad311e011f16a6806c25480c5cf08a526a35028d236985ce7ae1362cb26d0dd2ebd916aeb4101d6a5351f1738dbe4284fd30e358b2a10c364a5373c02b85_1280.jpg","imageWidth":3022,"imageHeight":3907,"imageSize":3563541,"views":622776,"downloads":316812,"collections":1342,"likes":1300,"comments":153,"user_id":2633886,"user":"intographics","userImageURL":"https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"},{"id":620817,"pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/","type":"photo","tags":"office, notes, notepad","previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gd84845466256f5f61084c4995e2160687ba7757073b61fdb95e7fb21b5e2aa9badc4778a1342ad56fd6b8ec6b19edd4c_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/g8056072c8c8db01d758f7a5cbf319a779a914a3d4f730a50b7b7b46acba71f843445a2bdb86a2ad9e367866dfc43b978fd35628317f6caa04823c301da0304df_1280.jpg","imageWidth":4288,"imageHeight":2848,"imageSize":2800224,"views":706100,"downloads":307769,"collections":1306,"likes":1102,"comments":259,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":1914130,"pageURL":"https://pixabay.com/photos/phone-wallpaper-spices-spoons-salt-1914130/","type":"photo","tags":"phone wallpaper, spices, spoons","previewURL":"https://cdn.pixabay.com/photo/2016/12/17/18/51/spices-1914130_150.jpg","previewWidth":133,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g504e4a58ddd0ba0aba366a4899d8f8d358030e8314d2102f2b9a493b591ae3198116b53cc58b239e78c3d098bdab7751d9354c13b6c703b256544e9b37d0021e_640.jpg","webformatWidth":571,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g1bb39558bdaea857f87c1c282a67df54e2f7f47e1a20f52893c09596321106557a88b71433a4838b8bea61a52fc6c8d90897d3eff00a7d537c2fd0d2698d6538_1280.jpg","imageWidth":3581,"imageHeight":4013,"imageSize":6193655,"views":381168,"downloads":251662,"collections":1136,"likes":1203,"comments":158,"user_id":3938704,"user":"Daria-Yakovleva","userImageURL":"https://cdn.pixabay.com/user/2016/12/06/15-05-11-524_250x250.jpg"},{"id":1979674,"pageURL":"https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/","type":"photo","tags":"relaxing, lounging, saturday","previewURL":"https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg","previewWidth":150,"previewHeight":102,"webformatURL":"https://pixabay.com/get/gd7ca142af6ebb51aa7c8e54d15623fb6e4c18937f4fa53db2751333a81df318c1494ac042a60c81747d3d9dc461bb1307d6f163b0825fc4e8f1e3658151089f2_640.jpg","webformatWidth":640,"webformatHeight":438,"largeImageURL":"https://pixabay.com/get/gebd7eec4853a9072ed05d91e15923142a468990d586739f5292e4c27dcb8481a0440aa4f92166adea7cd463709135db17909e662df5c6f2869d2fc2dc8a78aba_1280.jpg","imageWidth":5310,"imageHeight":3637,"imageSize":3751070,"views":384619,"downloads":221560,"collections":997,"likes":1129,"comments":142,"user_id":334088,"user":"JillWellington","userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"},{"id":410324,"pageURL":"https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/","type":"photo","tags":"iphone, smartphone, apps","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g40ad78561e324c884ae0109844939027814fd7f2f4945c25227a9b472814b65467d2ff22caff5f29e6547c6dbead9c9b_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gf718cf2f799399a7644d4ea68622faa4ba7fb65c2368502c1279319d47dc663d386a4a3738a595419484aa8298138c0a620903bb9be453abc8197f6dbb38c92e_1280.jpg","imageWidth":2180,"imageHeight":1453,"imageSize":477025,"views":701268,"downloads":408583,"collections":877,"likes":781,"comments":207,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":459196,"pageURL":"https://pixabay.com/photos/macbook-laptop-google-display-459196/","type":"photo","tags":"macbook, laptop, google","previewURL":"https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg","previewWidth":150,"previewHeight":92,"webformatURL":"https://pixabay.com/get/g856395a0bc81dedee8eb14a66e5c35754dc33f6bddcfd581c1508caafe5585f129c8c9946ea154a7a2d5fe75524dd5dd_640.jpg","webformatWidth":640,"webformatHeight":396,"largeImageURL":"https://pixabay.com/get/gdcf8e160a058bb76603034d831c0df996d64e0d3b02d8700e08dbe446cd5022cc884f4a9990c5897c7886275cff4e06569eb70c485ebac6c10c7d57bed453739_1280.jpg","imageWidth":3888,"imageHeight":2406,"imageSize":2883743,"views":540472,"downloads":272118,"collections":793,"likes":738,"comments":210,"user_id":377053,"user":"377053","userImageURL":""},{"id":2846221,"pageURL":"https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/","type":"photo","tags":"business, computer, mobile","previewURL":"https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/ge3dbc751484d06054da278fae285d5fe458c72839f83de364bd65b9cf342827e320c85f30e87f56210c2bc884dd3ef3dd911fbc0e0b0b5f36dfd3a80374dac2a_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g3defe0b5e3546171913c4105f93a9ac5f18548d8ad665501716c66998dfac425d1f08c241e7cfbe833cfe09ea49eac64ab3e6676ddd97878e3a4b1b499515524_1280.jpg","imageWidth":4608,"imageHeight":3072,"imageSize":2543501,"views":380118,"downloads":271261,"collections":1024,"likes":613,"comments":98,"user_id":6689062,"user":"6689062","userImageURL":""},{"id":1213475,"pageURL":"https://pixabay.com/photos/phone-wallpaper-heart-clouds-sky-1213475/","type":"photo","tags":"phone wallpaper, heart, clouds","previewURL":"https://cdn.pixabay.com/photo/2016/02/21/12/09/heart-1213475_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/gd2757256f8a22d3aa0cf1988ba597ff28ff2021d81b0532a6aa9352a0f794cb631cacba70c9715069cd5cbae92ee695ea34bdde7de2fa1b4a0a1a84949707b37_640.jpg","webformatWidth":427,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g0081e56c82ad9486186ccdd252294fa898ad546f7e5bfcba3e61bf2660ecbb00a3047ab9d9c452f0e7e2f2f9215e077eb70203e82a5b107cb14b21de9cbabf37_1280.jpg","imageWidth":1667,"imageHeight":2500,"imageSize":656080,"views":567696,"downloads":402849,"collections":754,"likes":765,"comments":103,"user_id":848168,"user":"oo11o","userImageURL":""},{"id":586268,"pageURL":"https://pixabay.com/photos/telephone-mobile-call-samsung-586268/","type":"photo","tags":"telephone, mobile, call","previewURL":"https://cdn.pixabay.com/photo/2015/01/02/00/01/telephone-586268_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g43f8e0c2c042c3049320cbb2459f21bcbb34abfe8b54c2f10b31dbceae5e5c08a956353f12c5031fceed06dcdfecddb6_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g8e6c894e2322e39b91960a6d2cb88c20afd7f78039ee663ecc6eeeed8442471ee5a3725e2f4b94234b849186dc578be9ebbf0888e9446a81b60d92a40c30e3b5_1280.jpg","imageWidth":3711,"imageHeight":2474,"imageSize":1772256,"views":155334,"downloads":92083,"collections":1348,"likes":195,"comments":51,"user_id":80788,"user":"niekverlaan","userImageURL":"https://cdn.pixabay.com/user/2014/05/19/00-26-35-848_250x250.jpg"},{"id":3746423,"pageURL":"https://pixabay.com/photos/ruin-castle-middle-ages-dramatic-3746423/","type":"photo","tags":"ruin, castle, middle ages","previewURL":"https://cdn.pixabay.com/photo/2018/10/14/13/01/ruin-3746423_150.jpg","previewWidth":106,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g34b3e136519f63850fe37b1621c2e5b1a4b76bf2a0929eed9716aac54c35889a2de966efc608b1a4e9b3b4ef7f30d5df4b09c5c14736368e9f88b45a85f1a25c_640.jpg","webformatWidth":452,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gc92180c77d006503281d2aa28137b3ef3f2255aa166b23e9e7f87968e0f7a52e18bb0706f879e89ff5a4133c4383b4b510f87b4c717231f7cee83d10f915bf04_1280.jpg","imageWidth":3508,"imageHeight":4961,"imageSize":4680479,"views":283900,"downloads":244845,"collections":810,"likes":669,"comments":132,"user_id":1664300,"user":"Darkmoon_Art","userImageURL":"https://cdn.pixabay.com/user/2020/09/09/14-30-42-106_250x250.jpg"},{"id":3076954,"pageURL":"https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/","type":"photo","tags":"desk, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g19d71af4601329454f3c87bcf73379a6a5a7cedfd56907d07757b3b7332f6a19024decf2b1dcfc23dd5b99ab3f5fcd44718bd8be11ff96274605b3ad7f6c6c93_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g97113c517a02eb2d95f45cfb9c059e7de5757c9079e04b45e0792cf235145c28acb5f37c928f9f67ff0fe77f004a174458abb4083b3dcf1b25353c2de12f6359_1280.jpg","imageWidth":5304,"imageHeight":3531,"imageSize":2258922,"views":232579,"downloads":149079,"collections":895,"likes":561,"comments":101,"user_id":2218222,"user":"Ylanite","userImageURL":"https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"},{"id":1842202,"pageURL":"https://pixabay.com/photos/camera-phone-picture-capture-1842202/","type":"photo","tags":"camera, phone, picture","previewURL":"https://cdn.pixabay.com/photo/2016/11/20/08/33/camera-1842202_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gb21def93af6ea47d5b0f92c8f2da5290a811fb1fbf84ac7fda675aa94d468c55627ea1e268e895f224ff64b0379b07bdd1c6aa72b324c5eda2d267ecd9173e52_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gef2791bfff9bd5c28ef2507ec468ca97d2454c686ca423991514e44ac02570470fd5801d423274010de7d846ee6a49a285ec72b514651d761e264316e69f9d51_1280.jpg","imageWidth":5472,"imageHeight":3648,"imageSize":2581728,"views":74007,"downloads":40990,"collections":1354,"likes":123,"comments":25,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":298243,"pageURL":"https://pixabay.com/photos/smoke-abstract-background-fumes-298243/","type":"photo","tags":"smoke, abstract, background","previewURL":"https://cdn.pixabay.com/photo/2014/03/25/22/53/smoke-298243_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g193cf0c9dd474c1be579f39f5816efe1200cedb3e15cddec9001d7645f37d15a57a1a1e3beb421f08f70766b506bce74_640.jpg","webformatWidth":425,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gb633afc8648ea2c8efa9717dceff564195a9e787ddf79b0774af574fccc9a6846fbe2d2a7a65ab2085c115580b920782c15eacdb81e34710a06f06ec5a45fbfc_1280.jpg","imageWidth":2848,"imageHeight":4288,"imageSize":2236073,"views":506157,"downloads":355925,"collections":723,"likes":621,"comments":96,"user_id":168090,"user":"goranmx","userImageURL":""},{"id":1659054,"pageURL":"https://pixabay.com/photos/grass-lawn-garden-park-ground-1659054/","type":"photo","tags":"grass, lawn, garden","previewURL":"https://cdn.pixabay.com/photo/2016/09/10/12/40/grass-1659054_150.jpg","previewWidth":81,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g46abf64c26608fe4585d9294dcecbf8ca4d7033ebb29485c18e461013ed5ba8b576253f34660ca493524b942b182d89c6cbee229cd40e9b416308bde8233fed8_640.jpg","webformatWidth":346,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g21ee0e88008a48d83c29756f1bea9560e4c991f35f778f632db53de86af5d8d1f36ab82f28570829e9d7bbac9736d052be52c9e47f5a9c09b67bd2d648d5c711_1280.jpg","imageWidth":2659,"imageHeight":4911,"imageSize":8444898,"views":384547,"downloads":308953,"collections":770,"likes":592,"comments":87,"user_id":1594796,"user":"jeonsango","userImageURL":"https://cdn.pixabay.com/user/2016/04/22/14-26-25-744_250x250.jpg"},{"id":2369664,"pageURL":"https://pixabay.com/photos/art-multicoloured-to-dye-abstract-2369664/","type":"photo","tags":"art, multicoloured, to dye","previewURL":"https://cdn.pixabay.com/photo/2017/06/03/20/12/art-2369664_150.jpg","previewWidth":99,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g8daccba6c71c6cd3d09be4595855ae05b1d6e5cbf2f09e2b1c39cb7dc66535dbe8d64a8fb0c252ca96fd8fe96028f497e781c2f74464f90cc563963b104063fb_640.jpg","webformatWidth":424,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g1c87c5bb0defc9c1df545b0a0dd8b6c075b0bbfdcd9dadc7e1779e4822ff61115c4c76850e3876a086ce2cab6182e1008d2864578a9b534ec6829bc98686d0cb_1280.jpg","imageWidth":3264,"imageHeight":4928,"imageSize":4032363,"views":435299,"downloads":387016,"collections":796,"likes":551,"comments":63,"user_id":4894494,"user":"eluela31","userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"},{"id":410311,"pageURL":"https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/","type":"photo","tags":"iphone, hand, screen","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g27af24ee1fed7f72664a3be6c3c4ea5bc02e9685328c4706285bbad6f184ab2cad79f858f93ff52e82cb90392b884be3_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g83d52f924380861d000358a42f3fc74aeeee32bda5ea3287b84faef831b64f3df8a2f5212395e553fe84f0d4d887ea1ac251c0cdddf834d8f762fd315cd4108e_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":416413,"views":513025,"downloads":255227,"collections":626,"likes":597,"comments":161,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":3354067,"pageURL":"https://pixabay.com/photos/phone-wallpaper-water-waves-ocean-3354067/","type":"photo","tags":"phone wallpaper, water, waves","previewURL":"https://cdn.pixabay.com/photo/2018/04/27/08/56/water-3354067_150.jpg","previewWidth":120,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g72108949d7f8a42c8bf2a72ac95966659ec82b5dc6ba7265c2272ea9a6f0bd9fce207c5290e5461f408c03ffe370cc267913f13d460d3960d31313f48d3dac86_640.jpg","webformatWidth":512,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g441473b7a939cd2e77bd92b1bed723c61f59997447bb82b79bdcdfe8ff0d944afe87864003fe40ed618d78865c040a61ccec6a51b1c5b9b3aab33ade5bd7be9e_1280.jpg","imageWidth":2982,"imageHeight":3727,"imageSize":3930860,"views":162731,"downloads":130457,"collections":1048,"likes":261,"comments":17,"user_id":8807492,"user":"ollivves","userImageURL":"https://cdn.pixabay.com/user/2018/04/26/09-00-53-532_250x250.jpg"},{"id":500291,"pageURL":"https://pixabay.com/photos/iphone-hand-girl-smartphone-500291/","type":"photo","tags":"iphone, hand, girl","previewURL":"https://cdn.pixabay.com/photo/2014/10/23/20/51/iphone-500291_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/geac03e62fc2a595a1696725c086568497fe0ab689e17af073d944ab6f7fff57ed23047236b532b2331a46d4c658cb91c_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g8b7eae621b8ff922c4e1704decbffc407b457317fc03df3865565eed79407dd59aa6152fd4a26fbe425b9ce2eb8e877954c5d92ea5cb329d5a7e385fa7ce0808_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":521447,"views":156466,"downloads":76453,"collections":1039,"likes":250,"comments":45,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":1052023,"pageURL":"https://pixabay.com/photos/glasses-book-phone-iphone-1052023/","type":"photo","tags":"glasses, book, phone","previewURL":"https://cdn.pixabay.com/photo/2015/11/19/21/14/glasses-1052023_150.jpg","previewWidth":150,"previewHeight":112,"webformatURL":"https://pixabay.com/get/gb98b9f306d7254ca5bae473105764ea19a437c98fa7efcaf8c7ec973896653519532c3bc05d962f65f2069127245e9a0546101046be1cf6bfea00b81acfad8ea_640.jpg","webformatWidth":640,"webformatHeight":480,"largeImageURL":"https://pixabay.com/get/g52f9ed5acd1a653d7283128f58f89d7a65293b1e9d99dafed2581673241a3fc6bd29976387e329b2689a8ddf6d029f1eedf4c273009f8a6e4c918e5c87a0ecc9_1280.jpg","imageWidth":4533,"imageHeight":3400,"imageSize":3219890,"views":269234,"downloads":163070,"collections":641,"likes":586,"comments":79,"user_id":1441456,"user":"DariuszSankowski","userImageURL":"https://cdn.pixabay.com/user/2015/12/21/10-54-58-771_250x250.jpg"}]}""";
