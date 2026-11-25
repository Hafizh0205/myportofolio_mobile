import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  test('Project serialization roundtrip works', () {
    const project = Project(
      title: 'My Portfolio',
      description: 'Flutter and Django app',
      techStack: 'Flutter, Django',
      projectUrl: 'https://github.com/Hafizh0205/myportofolio_mobile',
    );

    final json = project.toJson();
    expect(json['title'], 'My Portfolio');
    expect(json['tech_stack'], 'Flutter, Django');
    expect(json.containsKey('id'), isFalse);

    final parsed = Project.fromJson({
      ...json,
      'id': '123e4567-e89b-12d3-a456-426614174000',
    });
    expect(parsed.id, '123e4567-e89b-12d3-a456-426614174000');
    expect(parsed.title, project.title);
  });
}
