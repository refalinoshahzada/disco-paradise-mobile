import 'package:flutter/material.dart';
import 'package:disco_paradise/models/album_entry.dart';
import 'package:disco_paradise/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AlbumEntryPage extends StatefulWidget {
  const AlbumEntryPage({super.key});

  @override
  State<AlbumEntryPage> createState() => _AlbumEntryPageState();
}

class _AlbumEntryPageState extends State<AlbumEntryPage> {
  Future<List<AlbumEntry>> fetchAlbum(CookieRequest request) async {
    final response = await request.get('http://10.0.2.2/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object AlbumEntry
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
                    'Belum ada data album pada Disco Paradise.',
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
                      Text("${snapshot.data![index].fields.dateOfDistribution}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.stockAvailable}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.genre}")
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