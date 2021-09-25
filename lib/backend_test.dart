import 'package:dio/dio.dart';
import 'package:mongo_dart/mongo_dart.dart';

class GetAirports {
  Dio dio = new Dio();

  getAirports() async {
    try {
      final res = await dio.get(
        'https://backend-apricot.herokuapp.com/airport',
      );
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print('fail');
      }
    } catch (e) {
      print(e);
    }
  }

  addAirport(name, location) async {
    try {
      final res = await dio.post(
        'https://backend-apricot.herokuapp.com/airport',
        data: {'name': name, 'location': location},
      );
    } catch (e) {
      print(e);
    }
  }

  sendOrder() async {
    try {
      final res = await dio.post(
        'https://backend-apricot.herokuapp.com/order',
        data: {
          "user": "610a39d9cf4676263bfb09ab",
          "items": [
            {
              "item": "611caf0d0a73be0015f4b6ff",
              "quantity": 1
            },
            {
              "item": "611caef60a73be0015f4b6f8",
              "quantity": 1
            }
          ],
          "robot": "610a3867cf4676263bfb0992",
          "gate": "610a37bfcf4676263bfb0984",
          "status": "New Order",
          "restaurant": "611ca49d0a73be0015f4b69a"
        },
      );
    } catch (e) {
      print(e);
    }
  }

  deleteAirport(name) async {
    try {
      await dio.delete(
        'https://backend-apricot.herokuapp.com/airport/60f6be4dc0a0100015af1eff',
        // data: {
        //   '_id': ObjectId.fromHexString('60f6be4dc0a0100015af1eff'),
        //   'name': 'ar1',
        //   'location': 'ar',
        //   '__v': 0,
        // },
      );
    } catch (e) {
      print(e);
    }
  }
}
