import 'package:peruvian_identifier/models/LegalRepresentative.dart';

class Company {
  String ruc;
  String razonSocial;
  String fechaInscripcion;
  String fechaBaja;
  String contribuyenteCondicion;
  String contribuyenteTipo;
  String contribuyenteEstado;
  String nombreComercial;
  String domicilioFiscal;
  String sistemaEmision;
  String emisionElectronica;
  LegalRepresentative representanteLegal;

  Company.fromJSON(Map<String, dynamic> json) {
    this.ruc = json['ruc'];
    this.razonSocial = json['razon_social'];
    this.fechaInscripcion = json['fecha_inscripcion'];
    this.contribuyenteCondicion = json['contribuyente_condicion'];
    this.contribuyenteTipo = json['contribuyente_tipo'];
    this.contribuyenteEstado = json['contribuyente_estado'];
    this.nombreComercial = json['nombre_comercial'];
    this.domicilioFiscal = json['domicilio_fiscal'];
    this.sistemaEmision = json['sistema_emision'];
    this.emisionElectronica = json['emision_electronica'];
    this.fechaBaja = json["fecha_baja"];
    this.representanteLegal = LegalRepresentative.fromJSON(json['representante_legal']);
  }


}
