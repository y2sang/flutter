
import 'dart:math';

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

// Shape shapeFactory(String type) {
//   if (type == 'circle') return Circle(2);
//   if (type == 'square') return Square(2);
//   throw 'Can\'t create $type.';
// }

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  @override
  num get area => pi * pow(radius, 2);
}

class CircleMock implements Circle {
  @override
  num area = 0;
  @override
  num radius = 0;
}

class Square implements Shape {
  final num side;
  Square(this.side);

  @override
  num get area => pow(side, 2);

}
