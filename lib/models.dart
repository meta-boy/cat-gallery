// To parse this JSON data, do
//
//     final catsResponse = catsResponseFromJson(jsonString);

import 'dart:convert';

List<CatsResponse> catsResponseFromJson(String str) => List<CatsResponse>.from(json.decode(str).map((x) => CatsResponse.fromJson(x)));

String catsResponseToJson(List<CatsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatsResponse {
    CatsResponse({
        this.url,
        this.title,
    });

    String? url;
    String? title;

    factory CatsResponse.fromJson(Map<String, dynamic> json) => CatsResponse(
        url: json["url"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
    };
}
