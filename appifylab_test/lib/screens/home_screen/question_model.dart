class QuestionModel {
  String? title;
  String? explanation;
  int? mark;
  String? quizType;
  bool? nextButton;
  List<Options>? options;

  QuestionModel(
      {this.title,
      this.explanation,
      this.mark,
      this.quizType,
      this.nextButton,
      this.options});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    explanation = json['explanation'];
    mark = json['mark'];
    quizType = json['quiz_type'];
    nextButton = json['next_button'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['explanation'] = this.explanation;
    data['mark'] = this.mark;
    data['quiz_type'] = this.quizType;
    data['next_button'] = this.nextButton;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? value;
  bool? isRight;

  Options({this.value, this.isRight});

  Options.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    isRight = json['is_right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['is_right'] = this.isRight;
    return data;
  }
}
