import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;
import 'package:chuck_norris/services/category_service.dart';
import 'dart:io';
// import rispti'package:dotenv/dotenv.dart';

void main(List<String> arguments) async {
  //final env = DotEnv()..load();
  final cats = await getCategories();

  print("choose a category");
  for (var i = 0; i < cats.length; i++) {
    print("$i - ${cats[i]}");
  }
  
  final catIndex = stdin.readLineSync();
  final cat = cats[int.parse(catIndex!)];

  final quote = await chuck_norris.getCITfromcategory(cat);
  print("Quote: ${quote.cit} \nID: ${quote.id} \nTime: ${quote.createdAt}");

  return;

  // print("cosa vuoi cercare oggi??");
  // final input = stdin.readLineSync();

  // final cit = await chuck_norris.getCITbysearchParam(input!);
  // print(cit);

  // final ss = cit.toString();
  // await File("cit.txt").writeAsString(ss);
}