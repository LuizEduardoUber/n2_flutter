import 'package:flutter/material.dart';
import '../models/medication_model.dart';

class AddMedicationPage extends StatelessWidget {
  final Function(Medication) onAddMedication;

  AddMedicationPage({required this.onAddMedication});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController useController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Medicação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome da Medicação'),
            ),
            TextField(
              controller: useController,
              decoration: InputDecoration(labelText: 'Uso'),
            ),
            TextField(
              controller: dosageController,
              decoration: InputDecoration(labelText: 'Dosagem'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final medication = Medication(
                  name: nameController.text,
                  use: useController.text,
                  dosage: dosageController.text,
                );
                onAddMedication(medication);
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
