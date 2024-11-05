import 'package:flutter/material.dart';
import 'pages/add_medication_page.dart';
import '../models/medication_model.dart';

class MedicationListPage extends StatefulWidget {
  @override
  _MedicationListPageState createState() => _MedicationListPageState();
}

class _MedicationListPageState extends State<MedicationListPage> {
  List<Medication> medications = [];

  void _addMedication(Medication medication) {
    setState(() {
      medications.add(medication);
    });
  }

  void _removeMedication(int index) {
    setState(() {
      medications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Medicações'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medications[index].name),
            subtitle: Text('Uso: ${medications[index].use}\nDosagem: ${medications[index].dosage}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeMedication(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicationPage(onAddMedication: _addMedication),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
