class FlashCardModel {
  int? id;
  String? question;
  String? answerone;
  String? answertwo;
  String? answerthree;
  String? answerfour;
  String? rightanswer;
  FlashCardModel(
      {this.id,
      this.question,
      this.answerone,
      this.answertwo,
      this.answerthree,
      this.answerfour,
      this.rightanswer});

  FlashCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answerone = json['answerone'];
    answertwo = json['answertwo'];
    answerthree = json['answerthree'];
    answerfour = json['answerfour'];
    rightanswer = json['rightanswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answerone'] = answerone;
    data['answertwo'] = answertwo;
    data['answerthree'] = answerthree;
    data['answerfour'] = answerfour;
    data['rightanswer'] = rightanswer;
    return data;
  }
}
