part of 'form_bloc.dart';

@immutable
abstract class FormState extends Equatable {}

class DefaultFormState extends FormState {
  @override
  List<Object?> get props => [];
}

class InvalidFormState extends FormState {
  final Map<String, FieldError> fieldsError = <String, FieldError>{};

  @override
  List<Object?> get props => [fieldsError];
}

class ValidFormState extends FormState {
  @override
  List<Object?> get props => [];
}
