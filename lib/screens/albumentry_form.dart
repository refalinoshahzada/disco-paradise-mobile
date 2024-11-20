import 'package:flutter/material.dart';
import 'package:disco_paradise/widgets/left_drawer.dart';
import 'package:disco_paradise/models/album_entry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'package:disco_paradise/screens/menu.dart';

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
    final request = context.watch<CookieRequest>();
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        final response = await request.postJson(
                          "http://10.0.2.2/create-flutter/",
                          jsonEncode(<String, String>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'date_of_distribution': _dateOfDistribution,
                            'stock_available': _stockAvailable.toString(),
                            'genre': _genre,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Album baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }
                        }
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

class AlbumEntryPage extends StatefulWidget {
  const AlbumEntryPage({super.key});

  @override
  State<AlbumEntryPage> createState() => _AlbumEntryPageState();
}

class _AlbumEntryPageState extends State<AlbumEntryPage> {
  Future<List<AlbumEntry>> fetchAlbum(CookieRequest request) async {
    final response = await request.get('http://[APP_URL_KAMU]/json/');
    var data = response;
    List<AlbumEntry> listAlbum = [];
    for (var d in data) {
      if (d != null) {
        listAlbum.add(AlbumEntry.fromJson(d));
      }
    }
    return listAlbum;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchAlbum(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data album pada disco paradise.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.dateOfDistribution}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}