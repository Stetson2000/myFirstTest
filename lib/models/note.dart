class Note {
  final dynamic id;
  String? title;
  String? docId;
  String? content;

  Note({this.id = 0, this.title = '', this.content = '',this.docId = ''});

  Note.fromJson(Map<String, dynamic> json,docID)
      : this(id: json['id'], title: json['title'], content: json['content'],docId: docID);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content};
}
