import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peruvian_identifier/models/Person.dart';
import 'package:peruvian_identifier/repositories/person.repository.dart';

class PersonBloc {
  PersonRepository personRepository = new PersonRepository();

  final _personStreamController = new StreamController<Person>.broadcast();

  void dispose() {
    _personStreamController?.close();
  }

  Function(Person) get personSink => _personStreamController.sink.add;

  Stream<Person> get personStream => _personStreamController.stream;

  void findByDni(dni) async {
    Person person = await this.personRepository.getByDni(dni: dni);
    personSink(person);
  }
}
