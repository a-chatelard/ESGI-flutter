import 'package:equatable/equatable.dart';
import 'package:esgiflutter/app/modules/forms/validation/field_error.dart';
import 'package:esgiflutter/app/modules/forms/validation/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './form_event.dart';
part './form_state.dart';

class FormBloc extends Bloc<FormEvent, AppFormState> with ValidationMixin {
  FormBloc() : super(DefaultFormState()) {
    on<LoginFormSubmittedEvent>((event, emit) {
      Map<String, FieldError> fieldsError = <String, FieldError>{};
      if (isFieldEmpty(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.empty);
      } else if (!isEmailValid(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.badEmailFormat);
      }

      if (isFieldEmpty(event.password)) {
        fieldsError.putIfAbsent("password", () => FieldError.empty);
      }

      if (fieldsError.isNotEmpty) {
        emit(InvalidFormState(fieldsError));
      } else {
        emit(ValidFormState());
      }
      emit(DefaultFormState());
    });

    on<RegisterFormSubmittedEvent>((event, emit) {
      Map<String, FieldError> fieldsError = <String, FieldError>{};
      if (isFieldEmpty(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.empty);
      } else if (!isEmailValid(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.badEmailFormat);
      }

      if (isFieldEmpty(event.password)) {
        fieldsError.putIfAbsent("password", () => FieldError.empty);
      }
      if (!isPasswordSecured(event.password)) {
        fieldsError.putIfAbsent("password", () => FieldError.unsecuredPassword);
      }

      if (fieldsError.isNotEmpty) {
        emit(InvalidFormState(fieldsError));
      } else {
        emit(ValidFormState());
      }
      emit(DefaultFormState());
    });

    on<NoteFormSubmittedEvent>(((event, emit) {
      Map<String, FieldError> fieldsError = <String, FieldError>{};
      if (isFieldEmpty(event.title)) {
        fieldsError.putIfAbsent("title", () => FieldError.empty);
      }
      if (fieldsError.isNotEmpty) {
        emit(InvalidFormState(fieldsError));
      } else {
        emit(ValidFormState());
      }
      emit(DefaultFormState());
    }));

    on<ResetPasswordFormSubmittedEvent>(((event, emit) {
      Map<String, FieldError> fieldsError = <String, FieldError>{};
      if (isFieldEmpty(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.empty);
      } else if (!isEmailValid(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.badEmailFormat);
      }

      if (fieldsError.isNotEmpty) {
        emit(InvalidFormState(fieldsError));
      } else {
        emit(ValidFormState());
      }
      emit(DefaultFormState());
    }));
  }
}
