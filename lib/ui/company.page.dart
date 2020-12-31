import 'package:flutter/material.dart';
import 'package:peruvian_identifier/bloc/company.bloc.dart';
import 'package:peruvian_identifier/models/Company.dart';

class CompanyPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final companyBloc = new CompanyBloc();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Busqueda por RUC")),
        body: Column(children: [
          Container(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.business, color: Colors.blue),
                      hintText: '20600089065',
                      labelText: 'RUC',
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
                      companyBloc.findByRuc(search);
                    },
                  ),
                )
              ],
            ),
          ),
          StreamBuilder<Company>(
              stream: companyBloc.companyStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return  Expanded(child: showData(snapshot.data));
                } else {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      child: Center(child: CircularProgressIndicator()));
                }
               
              }),
        ]));
  }

  Widget showData(Company company) {
    Widget _listView = ListView(
      children: [
        Card(
            child: ListTile(
          title: Text("RUC"),
          subtitle: Text(company.ruc),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("RAZON SOCIAL"),
          subtitle: Text(company.razonSocial),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("FECHA DE CREACION"),
          subtitle: Text(company.fechaInscripcion),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("CONDICION"),
          subtitle: Text(company.contribuyenteCondicion),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("ESTADO"),
          subtitle: Text(company.contribuyenteEstado),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("DOMICILIO"),
          subtitle: Text(company.domicilioFiscal),
          trailing: Icon(Icons.more_vert),
        )),
        Card(
            child: ListTile(
          title: Text("FECHA DE BAJA"),
          subtitle: Text(company.fechaBaja),
          trailing: Icon(Icons.more_vert),
        )),
        SizedBox(
          height: 8.0,
        ),
        Center(
            child: Text(
          "REPRESENTANTE LEGAL",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
              fontSize: 20.0),
        )),
        Divider(
          color: Colors.lightBlueAccent,
          thickness: 2.0,
        ),
        Card(
            child: ListTile(
          title: Text("DNI"),
          subtitle: Text(company.representanteLegal.dni),
          trailing: Icon(Icons.more_vert),
          dense: true,
        )),
        Card(
            child: ListTile(
          title: Text("NOMBRES"),
          subtitle: Text(company.representanteLegal.nombres),
          trailing: Icon(Icons.more_vert),
          dense: true,
        )),
        Card(
            child: ListTile(
          title: Text("DESDE"),
          subtitle: Text(company.representanteLegal.desde),
          trailing: Icon(Icons.more_vert),
          dense: true,
        ))
      ],
    );

    return _listView;
  }
}
