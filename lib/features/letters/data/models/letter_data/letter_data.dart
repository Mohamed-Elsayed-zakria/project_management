class LetterData {
  String? id;
  String? projectId;
  String? letterType;
  String? number;
  String? date;
  String? subject;
  String? type;
  String? replyStatus;
  String? letterFile;
  String? replyTo;
  String? createdAt;
  String? updatedAt;

  LetterData({
    this.id,
    this.projectId,
    this.letterType,
    this.number,
    this.date,
    this.subject,
    this.type,
    this.replyStatus,
    this.letterFile,
    this.replyTo,
    this.createdAt,
    this.updatedAt,
  });

  factory LetterData.fromJson(Map<String, dynamic> json) => LetterData(
        id: json['_id'] as String?,
        projectId: json['projectId'] as String?,
        letterType: json['letterType'] as String?,
        number: json['number'] as String?,
        date: json['date'] as String?,
        subject: json['subject'] as String?,
        type: json['type'] as String?,
        replyStatus: json['replyStatus'] as String?,
        letterFile: json['letterFile'] as String?,
        replyTo: json['replyTo'] as String? ?? '',
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'projectId': projectId,
        'letterType': letterType,
        'number': number,
        'date': date,
        'subject': subject,
        'type': type,
        'replyStatus': replyStatus,
        'letterFile': letterFile,
        'replyTo': replyTo,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
