// To parse this JSON data, do
//
//     final albumEntry = albumEntryFromJson(jsonString);

import 'dart:convert';

List<AlbumEntry> albumEntryFromJson(String str) => List<AlbumEntry>.from(json.decode(str).map((x) => AlbumEntry.fromJson(x)));

String albumEntryToJson(List<AlbumEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumEntry {
    String model;
    String pk;
    Fields fields;

    AlbumEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory AlbumEntry.fromJson(Map<String, dynamic> json) => AlbumEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    String dateOfDistribution;
    int stockAvailable;
    String genre;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.dateOfDistribution,
        required this.stockAvailable,
        required this.genre,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        dateOfDistribution: json["date_of_distribution"],
        stockAvailable: json["stock_available"],
        genre: json["genre"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "date_of_distribution": dateOfDistribution,
        "stock_available": stockAvailable,
        "genre": genre,
    };
}
