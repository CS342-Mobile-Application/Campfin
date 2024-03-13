import 'package:get/get.dart';
import 'package:mobile_campfin/data/client/dio_client.dart';

class PlaceController extends GetxController {
  var placeList = <dynamic>[].obs;
  var isLoading = true.obs;

  final dio = DioClient().dio;

  @override
  void onInit() {
    super.onInit();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    try {
      isLoading(true);

      final response = await dio.post(
        '/place/get-places',
        data: {
          "perPages": 10,
          "currentPage": 1,
          "sortType": "asc",
        },
      );

      if (response.statusCode == 201) {
        placeList.assignAll(response.data['datas'] ?? []);
      } else {
        print('Error fetching places: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error fetching places: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> getPlaceById (String id) async {
    try {
      isLoading(true);

      final response = await dio.get(
        '/place/get-place/$id',
      );
      
      if (response.statusCode == 200) {
        print('response.data get place: ${response.data['data']}');
        return response.data['data'];
      } else {
        print('Error fetching place: ${response.statusMessage}');
      }

   
    } catch (e) {
      print('Error fetching place: $e');
    } finally {
      isLoading(false);
    }
  }

  
}