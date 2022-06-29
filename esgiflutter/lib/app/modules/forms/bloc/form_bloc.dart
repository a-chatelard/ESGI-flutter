import 'package:equatable/equatable.dart';
import 'package:esgiflutter/app/modules/forms/validation/field_error.dart';
import 'package:esgiflutter/app/modules/forms/validation/validation_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> with ValidationMixin {
  FormBloc() : super(DefaultFormState()) {
    
    on<LoginFormSubmittedEvent>((event, emit) {
      Map<String, FieldError> fieldsError = <String, FieldError>{};
      if (isFieldEmpty(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.empty);
      } else if (!isEmailValid(event.email)) {
        fieldsError.putIfAbsent("email", () => FieldError.badEmailFormat);
      }
    });
  }
}
