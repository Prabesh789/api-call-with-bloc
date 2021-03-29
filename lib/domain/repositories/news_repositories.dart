import 'package:apicallwithbloc/domain/model/news_model.dart';
import 'package:dio/dio.dart';

class NewsRepositories {
  Dio _dio = Dio();
  Future<NewsModel> fetchData() async {
    try {
      final response = await _dio.get(
          'https://thegrowingdeveloper.org/apiview?id=2&type=application/json');

      NewsModel result = NewsModel.fromJson(response.data);
      print(result);
      return result;
    } catch (e) {
      return null;
    }
  }
}

// class NewsRepository {
//   Dio _dio = Dio();
//   Future<NewsModelResponse> fetchTopHeadlines({String countryCode}) async {
//     try {
//       final response =
//           await _dio.get("$baseUrl$topHeadlinesEndpoint$countryCode$apiKey");

//       NewsModelResponse result = NewsModelResponse.fromJson(response.data);
//       return result;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
//
//  Future<Map<String, dynamic>> fetchData() async {
//     try {
//       final response = await http.get(
//           'https://thegrowingdeveloper.org/apiview?id=2&type=application/json');
//       final parsed = json.decode(response.body);
//       List<Map<dynamic, dynamic>> jsonList =
//           json.decode(response.body.toString()) as List;
//       if (response.statusCode == 200) {
//         List<Facts> myList = parsed['facts']
//             .map((jsonElement) => Facts.fromJson(jsonElement))
//             .toList();
//         print(myList);
//         NewsModel newsModel = NewsModel(
//           category: parsed['category'],
//           facts: myList,
//         );
//         Map<String, dynamic> result = {"success": "true", "data": newsModel};
//         return result;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return e;
//     }
//   }
