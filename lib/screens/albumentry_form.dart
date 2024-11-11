import 'package:flutter/material.dart';
import 'package:disco_paradise/widgets/left_drawer.dart';

class AlbumEntryFormPage extends StatefulWidget {
  const AlbumEntryFormPage({super.key});

  @override
  State<AlbumEntryFormPage> createState() => _AlbumEntryFormPageState();
}

class _AlbumEntryFormPageState extends State<AlbumEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _dateOfDistribution = "";
  int _stockAvailable = 0;
  String _genre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add New Album Entry'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Name", "Enter Album name", (value) => _name = value!),
              _buildTextField("Price", "Enter price", (value) => _price = int.tryParse(value!) ?? 0, isNumeric: true),
              _buildTextField("Description", "Enter description", (value) => _description = value!),
              _buildTextField("Date of Distribution", "Enter distribution date", (value) => _dateOfDistribution = value!),
              _buildTextField("Stock Available", "Enter stock available", (value) => _stockAvailable = int.tryParse(value!) ?? 0, isNumeric: true),
              _buildTextField("Genre", "Enter genre", (value) => _genre = value!),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Album entry saved successfully'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                    Text('Date of Distribution: $_dateOfDistribution'),
                                    Text('Stock Available: $_stockAvailable'),
                                    Text('Genre: $_genre')
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextField(
      String label, String hint, Function(String?) onChanged, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: onChanged,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "$label cannot be empty!";
          }
          if (isNumeric && int.tryParse(value) == null) {
            return "$label must be a number!";
          }
          return null;
        },
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
