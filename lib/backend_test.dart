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
