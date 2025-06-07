class NotificationStatusResponse {
  final String status;
  final NotificationStatusData data;

  NotificationStatusResponse({
    required this.status,
    required this.data,
  });

  factory NotificationStatusResponse.fromJson(Map<String, dynamic> json) {
    return NotificationStatusResponse(
      status: json['status'] as String,
      data: NotificationStatusData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class NotificationStatusData {
  final List<StatusCount> statusStats;
  final List<TypeCount> typeStats;

  NotificationStatusData({
    required this.statusStats,
    required this.typeStats,
  });

  factory NotificationStatusData.fromJson(Map<String, dynamic> json) {
    return NotificationStatusData(
      statusStats: (json['statusStats'] as List<dynamic>)
          .map((e) => StatusCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeStats: (json['typeStats'] as List<dynamic>)
          .map((e) => TypeCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StatusCount {
  final String? id;
  final int count;

  StatusCount({
    this.id,
    required this.count,
  });

  factory StatusCount.fromJson(Map<String, dynamic> json) {
    return StatusCount(
      id: json['_id'] as String?,
      count: json['count'] as int,
    );
  }
}

class TypeCount {
  final String? id;
  final int count;

  TypeCount({
    this.id,
    required this.count,
  });

  factory TypeCount.fromJson(Map<String, dynamic> json) {
    return TypeCount(
      id: json['_id'] as String?,
      count: json['count'] as int,
    );
  }
}