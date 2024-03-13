import 'package:get/get.dart';
import 'package:mobile_campfin/data/client/dio_client.dart';

class TripController extends GetxController {
  var tripList = <dynamic>[].obs;
  var isLoading = true.obs;

  final dio = DioClient().dio;

  @override
  void onInit() {
    super.onInit();
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    try {
      isLoading(true);

      final response = await dio.post(
        '/trip/get-trips',
        data: {
          "perPages": 10,
          "currentPage": 1,
          "sortType": "asc",
        },
      );

      if (response.statusCode == 201) {
        tripList.assignAll(response.data['datas'] ?? []);
      } else {
        print('Error fetching trips: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error fetching trips: $e');
    } finally {
      isLoading(false);
    }
  }
  
 
  Future<dynamic> getTripById (String id) async {
    try {
      isLoading(true);

      final response = await dio.get(
        '/trip/$id',
      );
      
      if (response.statusCode == 200) {
        print('response.data get trip: ${response.data['data']}');
        return response.data['data'];
      } else {
        print('Error fetching trip: ${response.statusMessage}');
      }

   
    } catch (e) {
      print('Error fetching trip: $e');
    } finally {
      isLoading(false);
    }
  }

  List<dynamic> getTrips() {
    return tripList;
  }

}
