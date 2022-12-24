class TodoModel {
  int? id;
  String? name;
  String? section;

  TodoModel({
    this.id,
    required this.name,
    required this.section
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'section' :section
    };
  }

  @override
  String toString(){
    return 'TodoModel(id : $id, name : $name, section : $section)';
  }
}