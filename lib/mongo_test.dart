import 'package:mongo_dart/mongo_dart.dart';

void start() async {
  final db = await Db.create(
      "mongodb+srv://dbuser:dbuser@cluster0.ksfka.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
  await db.open();
  final airports = db.collection('carts');
  final ar = await airports.find().toList();
  print(ar[0]["total_price"]);
}

void main(List<String> arguments) {
  start();
}
