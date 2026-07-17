import '../model/classroom_type.dart';
import '../model/curriculum_response.dart';

final curriculumLessonMock = CurriculumResponse(
  id: 1,
  title: 'Flutter 상태관리 심화',
  lessonNo: 3,
  totalLessonCount: 8,
  type: LessonType.online,
  isSupplement: true,
  date: DateTime(2026, 5, 20),
  startTime: '12:30',
  endTime: '13:30',
  place: '토즈 강남역점 3번방',
  memo: 'Riverpod Provider와 ViewModel의 역할을 분리하고 공통 버튼 컴포넌트 구조를 개선한다.',
  progress: 3,
);
