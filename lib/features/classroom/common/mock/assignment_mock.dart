import '../model/assignment_info_response.dart';

final mockAssignmentItems = [
  AssignmentInfoResponse(
    currentSession: '현재 회차과제',
    title: '과제명',
    dueDate: DateTime(2026, 5, 3, 23, 59),
    submittedCount: 0,
    totalCount: 1,
  ),
  AssignmentInfoResponse(
    currentSession: '2회차',
    title: 'Flutter Widget 과제',
    dueDate: DateTime(2026, 5, 5, 23, 59),
    submittedCount: 3,
    totalCount: 5,
  ),
  AssignmentInfoResponse(
    currentSession: '3회차',
    title: 'Riverpod 상태관리 실습',
    dueDate: DateTime(2026, 5, 8, 23, 59),
    submittedCount: 5,
    totalCount: 5,
  ),
];
