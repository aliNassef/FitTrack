class NotificationModel {
  final String id;
  final String recipient;
  final Sender sender;
  final String title;
  final String message;
  final String? icon;
  final String priority;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int version;

  NotificationModel({
    required this.id,
    required this.recipient,
    required this.sender,
    required this.title,
    required this.message,
    this.icon,
    required this.priority,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] ?? '',
      recipient: json['recipient'] ?? '',
      sender: Sender.fromJson(json['sender'] ?? {}),
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      icon: json['icon'],
      priority: json['priority'] ?? 'medium',
      status: json['status'] ?? 'unread',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'recipient': recipient,
      'sender': sender.toJson(),
      'title': title,
      'message': message,
      'icon': icon,
      'priority': priority,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}

class Sender {
  final String id;
  final String name;
  final String email;

  Sender({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }
}

class NotificationResponse {
  final String status;
  final NotificationData data;

  NotificationResponse({
    required this.status,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      status: json['status'] ?? '',
      data: NotificationData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class NotificationData {
  final List<NotificationModel> notifications;
  final NotificationPagination pagination;

  NotificationData({
    required this.notifications,
    required this.pagination,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) => NotificationModel.fromJson(e))
              .toList() ??
          [],
      pagination: NotificationPagination.fromJson(
          json['pagination'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications.map((e) => e.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}

class NotificationPagination {
  final int total;
  final int page;
  final int pages;

  NotificationPagination({
    required this.total,
    required this.page,
    required this.pages,
  });

  factory NotificationPagination.fromJson(Map<String, dynamic> json) {
    return NotificationPagination(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      pages: json['pages'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'page': page,
      'pages': pages,
    };
  }
}