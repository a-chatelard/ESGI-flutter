part of './form_bloc.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginFormSubmittedEvent extends FormEvent {
  final String email;
  final String password;

  LoginFormSubmittedEvent(this.email, this.password);
}

class RegisterFormSubmittedEvent extends FormEvent {
  final String email;
  final String password;

  RegisterFormSubmittedEvent(this.email, this.password);
}

class ResetPasswordFormSubmittedEvent {
  final String email;

  ResetPasswordFormSubmittedEvent(this.email);
}

class NoteFormSubmittedEvent {
  final String title;
  final String description;

  NoteFormSubmittedEvent(this.title, this.description);
}
