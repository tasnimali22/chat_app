part of 'regester_cubit.dart';

@immutable
sealed class RegesterState {}

final class RegesterInitial extends RegesterState {}

final class RegesterLoadingState extends RegesterState {}

final class RegesterSuccessState extends RegesterState {}

final class RegesterFailureState extends RegesterState {
  String errorMassage;
  RegesterFailureState({required this.errorMassage});
}
