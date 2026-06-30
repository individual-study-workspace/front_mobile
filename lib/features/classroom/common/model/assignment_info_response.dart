class AssignmentInfoResponse {
  final String currentSession;
  final String title;
  final DateTime dueDate;
  final int submittedCount;
  final int totalCount;

  const AssignmentInfoResponse({
    required this.currentSession,
    required this.title,
    required this.dueDate,
    required this.submittedCount,
    required this.totalCount,
  });
}
