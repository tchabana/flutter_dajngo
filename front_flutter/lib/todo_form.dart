import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _image = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Envoyer les données à un backend Django
      final url = Uri.parse('http://10.0.2.2:8000/apis/v1/?format=json');
      final response = await http.post(
        url,
        body: {
          'title': _title,
          'description': _description,
          'image': _image,
        },
      );

      if (response.statusCode == 200) {
        print('Données envoyées avec succès.');
        // Ajoutez ici la logique supplémentaire après l'envoi des données
      } else {
        print('Erreur lors de l\'envoi des données.');
        // Gérez ici les erreurs d'envoi des données
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Titre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un titre.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une description.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Lien de l\'image'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un lien d\'image.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _image = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
