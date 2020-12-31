import 'package:flutter/material.dart';

class LegalRepresentative{

  String dni;
  String cargo;
  String nombres;
  String desde;

  LegalRepresentative({this.dni, this.cargo, this.desde, this.nombres});

  LegalRepresentative.fromJSON(Map<String, dynamic> json){
    print("REPRESENTANTE LEGAL");
    print(json);
    this.dni = json['dni'];
    this.cargo = json['cargo'];
    this.nombres = json['nombres'];
    this.desde = json['desde'];
  }

}