import 'package:commushare_front/model/profile.dart';

class Availability {
  final bool available;
  final String? borrower;
  final DateTime? startDate;
  final DateTime? endDate;

  const Availability({
    required this.available,
    this.borrower,
    this.startDate,
    this.endDate,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      available: json['available'] ?? true,
      borrower: json['borrower'] ?? "",
      //startDate: DateTime.parse(json['startDate'] ?? ""),
      //endDate: DateTime.parse(json['endDate'] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        'available': available,
        'borrower': borrower ?? "",
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
      };
}
