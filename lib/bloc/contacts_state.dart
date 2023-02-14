part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState extends Equatable {}

class ContactsLoadingState extends ContactsState {
  @override
  List<Object?> get props => [];
}

class ContactsLoadedState extends ContactsState {
  final List<UserModel> users;
  ContactsLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class ContactsErrorState extends ContactsState {
  final String error;
  ContactsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}