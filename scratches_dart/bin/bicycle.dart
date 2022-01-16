class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  //
  // Bicycle(int cadence, int speed, int gear)
  //     : this.cadence = cadence,
  //       this.speed = speed,
  //       this.gear = gear;
  Bicycle(this.cadence, this.gear);

  int get speed => this._speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() {
    return 'Bicycle: $speed mph';
  }
}

void main() {
  var bike2 = new Bicycle(2, 1);
  print(bike2);
  print(bike2.gear);
}
