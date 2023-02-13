import 'dart:convert';

EntExportActivity entExportActivityFromJson(String str) => EntExportActivity.fromJson(json.decode(str));

String entExportActivityToJson(EntExportActivity data) => json.encode(data.toJson());

class EntExportActivity {
    EntExportActivity({
        required this.actName,
        required this.actDescription,
        required this.actStatus,
    });

    String actName;
    String actDescription;
    String actStatus;

    factory EntExportActivity.fromJson(Map<String, dynamic> json) => EntExportActivity(
        actName: json["act_name"],
        actDescription: json["act_description"],
        actStatus: json["act_status"],
    );

    Map<String, dynamic> toJson() => {
        "act_name": actName,
        "act_description": actDescription,
        "act_status": actStatus,
    };
}