class TripModel {
  final int totalItems;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;
  final Option option;
  final List<Data> datas;

  TripModel({
    required this.totalItems,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
    required this.option,
    required this.datas,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      totalItems: json['totalItems'],
      itemsPerPage: json['itemsPerPage'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      option: Option.fromJson(json['option']),
      datas: List<Data>.from(json['datas'].map((data) => Data.fromJson(data))),
    );
  }
}

class Option {
  final String sortField;
  final String sortType;
  final String search;

  Option({
    required this.sortField,
    required this.sortType,
    required this.search,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      sortField: json['sortField'],
      sortType: json['sortType'],
      search: json['search'],
    );
  }
}

class Data {
  final String id;
  final String title;
  final String description;
  final int maxParticipant;
  final bool isPublic;
  final String status;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String updatedAt;
  final String? campName; // Nullable
  final String userId;
  final List<String> agenda;
  final List<String> participants;
  final List<String> preParticipants;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.maxParticipant,
    required this.isPublic,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.campName,
    required this.userId,
    required this.agenda,
    required this.participants,
    required this.preParticipants,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      maxParticipant: json['maxParticipant'],
      isPublic: json['isPublic'],
      status: json['status'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      campName: json['campName'],
      userId: json['userId'],
      agenda: List<String>.from(json['agenda'].map((agenda) => agenda)),
      participants: List<String>.from(
          json['participants'].map((participant) => participant)),
      preParticipants: List<String>.from(
          json['preParticipants'].map((preParticipant) => preParticipant)),
    );
  }
}
