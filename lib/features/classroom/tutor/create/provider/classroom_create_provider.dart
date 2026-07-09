import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../model/classroom_create_state.dart';

final classroomCreateProvider =
    StateNotifierProvider<ClassroomCreateNotifier, ClassroomCreateState>(
      (ref) => ClassroomCreateNotifier(),
    );

class ClassroomCreateNotifier extends StateNotifier<ClassroomCreateState> {
  ClassroomCreateNotifier() : super(ClassroomCreateState());

  /// step 이동
  void nextStep() {
    switch (state.step) {
      case ClassroomCreateStep.basicInfo:
        state = state.copyWith(step: ClassroomCreateStep.schedule);
        break;

      case ClassroomCreateStep.schedule:
        state = state.copyWith(step: ClassroomCreateStep.payment);
        break;

      case ClassroomCreateStep.payment:
        state = state.copyWith(step: ClassroomCreateStep.confirm);
        break;

      case ClassroomCreateStep.confirm:
        break;
    }
  }

  void previousStep() {
    switch (state.step) {
      case ClassroomCreateStep.schedule:
        state = state.copyWith(step: ClassroomCreateStep.basicInfo);
        break;

      case ClassroomCreateStep.payment:
        state = state.copyWith(step: ClassroomCreateStep.schedule);
        break;

      case ClassroomCreateStep.confirm:
        state = state.copyWith(step: ClassroomCreateStep.payment);
        break;

      case ClassroomCreateStep.basicInfo:
        break;
    }
  }

  /// basicInfo
  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
  }

  void setLessonType(LessonType value) {
    if (state.lessonType == value) {
      state = state.copyWith(lessonType: null);
    } else {
      state = state.copyWith(lessonType: value);
    }
  }

  /// schedule
  void setScheduleType(ScheduleType value) {
    if (state.scheduleType == value) {
      state = state.copyWith(scheduleType: null);
    } else {
      state = state.copyWith(scheduleType: value);
    }
  }

  void setSelectedDays(ClassDays day) {
    final days = [...state.selectedDays];

    if (days.contains(day)) {
      days.remove(day);
    } else {
      days.add(day);
    }
    state = state.copyWith(selectedDays: days);
  }

  void setStartDay(DateTime value) {
    state = state.copyWith(startDay: value);
  }

  void setStartTime(TimeOfDay value) {
    state = state.copyWith(startTime: value);
  }

  void setTotalLessons(int? value) {
    state = state.copyWith(totalLessons: value);
  }

  void selectCalendarDate(DateTime date) {
    state = state.copyWith(selectedCalendarDate: date);
  }

  void goToPreviousMonth() {
    final month = state.currentCalendarDate;
    state = state.copyWith(
      currentCalendarDate: DateTime(month.year, month.month - 1),
    );
  }

  void goToNextMonth() {
    final month = state.currentCalendarDate;
    state = state.copyWith(
      currentCalendarDate: DateTime(month.year, month.month + 1),
    );
  }

  void setHasInput(bool value) {
    state = state.copyWith(hasInput: value);
  }

  void setCurrentCalendarDate(DateTime date) {
    state = state.copyWith(currentCalendarDate: date);
  }

  /// payment
  void setBillingType(BillingType value) {
    state = state.copyWith(billingType: value);
  }

  void setBillingDate(int value) {
    state = state.copyWith(billingDate: value);
  }

  void setLessonFee(int? value) {
    state = state.copyWith(lessonFee: value);
  }

  void setPerLessonFee(int? value) {
    state = state.copyWith(perLessonFee: value);
  }

  void setPerLessonFeeCount(int? value) {
    state = state.copyWith(perLessonCount: value);
  }

  void setMonthlyLessonFee(int? value) {
    state = state.copyWith(monthlyLessonFee: value);
  }
}
