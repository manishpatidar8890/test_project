// To parse this JSON data, do
//
//     final tableItem = tableItemFromJson(jsonString);

import 'dart:convert';

List<TableItem> tableItemFromJson(String str) =>
    List<TableItem>.from(json.decode(str).map((x) => TableItem.fromJson(x)));

String tableItemToJson(List<TableItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableItem {
  String? assignedWaiterId;
  String? id;
  String? sectionId;
  String? name;
  int? order;
  int? sortOrder;
  String? tableName;

  TableItem({
    this.assignedWaiterId,
    this.id,
    this.sectionId,
    this.name,
    this.order,
    this.sortOrder,
    this.tableName,
  });

  factory TableItem.fromJson(Map<String, dynamic> json) => TableItem(
        assignedWaiterId: json["assignedWaiterId"]!,
        id: json["id"],
        sectionId: json["sectionId"]!,
        name: json["name"]!,
        order: json["order"],
        sortOrder: json["sortOrder"],
        tableName: json["tableName"],
      );

  Map<String, dynamic> toJson() => {
        "assignedWaiterId": assignedWaiterId,
        "id": id,
        "sectionId": sectionId,
        "name": name,
        "order": order,
        "sortOrder": sortOrder,
        "tableName": tableName,
      };
}
