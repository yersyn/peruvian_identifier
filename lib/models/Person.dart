class Person{

  String dni;
  String name;
  String firstName;
  String lastName;
  String cui;

  Person({this.dni, this.name, this.firstName, this.lastName});

  Person.fromJson(Map<String, dynamic> json){
    dni = json['dni'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    cui = json['cui'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dni'] = this.dni;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['cui'] = this.cui;
    return data;
  }

}