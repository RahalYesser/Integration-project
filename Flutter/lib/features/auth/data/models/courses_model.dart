
class CoursesModel {
  List<String> course;

  CoursesModel({
    required this.course,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      course: json['course'],
    );
  }

  
  Map<String, dynamic> toMap() {
  return {
    'course': course,
    
  };
}

factory CoursesModel.fromMap(Map<String, dynamic> map) {
  return CoursesModel(
    course: map['course'].cast<String>() ?? [],
  );
}



  
  Map<String, dynamic> toJson() {
    return {
      'course': course,
    };
  }
}

