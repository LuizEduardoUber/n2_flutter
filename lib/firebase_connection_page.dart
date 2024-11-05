import 'package:flutter/material.dart';

class FirebaseConnectionPage extends StatelessWidget {
  Future<String> fakeFirebaseFetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Dados de exemplo recebidos';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conexão com Firebase'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fakeFirebaseFetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao conectar com o Firebase (exemplo)');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dados recebidos com sucesso : ${snapshot.data}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/medicationList');
                    },
                    child: Text('Ir para Lista de Medicações'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
