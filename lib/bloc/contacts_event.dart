part of 'contacts_bloc.dart';


abstract class ContactsEvent extends Equatable {
  const ContactsEvent();
}

class FetchApiEvent extends ContactsEvent {
  @override
  List<Object> get props => [];
}
