import 'dart:async';

import 'package:peruvian_identifier/models/Company.dart';
import 'package:peruvian_identifier/repositories/company.repository.dart';

class CompanyBloc {
  CompanyRepository _companyRepository = new CompanyRepository();

  //Definicion de los Streams
  final _companyStreamController = StreamController<Company>.broadcast();

  Function(Company) get companySink => _companyStreamController.sink.add;

  Stream<Company> get companyStream => _companyStreamController.stream;

  void dipose() {
    _companyStreamController?.close();
  }

//  Logica de negocio
  void findByRuc(String ruc) async {
    Company company = await this._companyRepository.getByRUC(ruc: ruc);
    this.companySink(company);
  }
}
