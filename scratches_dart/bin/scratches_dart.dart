import 'dart:math';

import 'bicycle.dart';
import 'function.dart';
import 'rectangle.dart';
import 'shape.dart';

void main(List<String> arguments) {
  print('Hello world!');
  var bike2 = Bicycle(2, 1);
  print(bike2);
  // print(bike2.gear);

  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());

  final circle = Circle(2);
  final square = Square(2);
  print(circle.area);
  print(square.area);

  // final circle2 = shapeFactory('circle');
  // final square2 = shapeFactory('square');
  // final blah = shapeFactory('blah');

  final circle2 = Shape('circle');
  final square2 = Shape('square');
  // final blah = Shape('blah');

  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  values.map(scream).forEach(print);

  values.skip(1).take(3).map(scream).forEach(print);


}
