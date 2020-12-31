import 'package:flutter/material.dart';
import 'package:peruvian_identifier/bloc/person.bloc.dart';
import 'package:peruvian_identifier/models/Person.dart';

class PersonPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final personBloc = new PersonBloc();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Buscar por DNI"),
      ),
      body: Column(children: [
        Container(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity_sharp, color: Colors.blue),
                    hintText: '46916798',
                    labelText: 'DNI',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingrese su DNI";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    search = val;
                    print(search);
                  },
                ),
              ),
              SizedBox(width: 1),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("Click");
                    print(search);
                    personBloc.findByDni(search);
                  },
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<Person>(
          stream: personBloc.personStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: 250,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.blue,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person, size: 90),
                        title: Text(snapshot.data.dni,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "${snapshot.data.name} ${snapshot.data.firstName} ${snapshot.data.lastName}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text("CUI: ${snapshot.data.cui}", style: TextStyle(color: Colors.blueGrey), textAlign: TextAlign.left),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
        ButtonBar(
          children: [
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'person');
                },
                child: Text("Buscar por DNI")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'company');
                },
                child: Text("Buscar por RUC"))
          ],
        )
      ]),
    );
  }
}
