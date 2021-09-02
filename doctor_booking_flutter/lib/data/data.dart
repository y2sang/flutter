import 'package:doctor_booking_flutter/model/speciality.dart';
import 'package:flutter/cupertino.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];

  //1

  specialities.add(SpecialityModel(
      backgroundColor: Color(0xffFBB97C),
      imgAssetPath: "assets/img1.png",
      noOfDoctors: 10,
      speciality: "Cough & Cold"));

  //2
  specialities.add(SpecialityModel(
      backgroundColor: Color(0xffF69383),
      imgAssetPath: "assets/img2.png",
      noOfDoctors: 17,
      speciality: "Heart Specialist"));

  //3
  specialities.add(SpecialityModel(
      backgroundColor: Color(0xffEACBCB),
      imgAssetPath: "assets/img3.png",
      noOfDoctors: 27,
      speciality: "Diabetes Care"));

  return specialities;
}
