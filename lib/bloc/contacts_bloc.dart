
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../model/usermodel.dart';
import '../repository/home_repository.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final HomeRepository _homRepository;

  ContactsBloc(this._homRepository) : super(ContactsLoadingState()) {
    on<FetchApiEvent>((event, emit) async {
      emit(ContactsLoadingState());
      try {
        final users = await _homRepository.fetchAPI();
        //print('emittedLoadedstate');
        emit(ContactsLoadedState(users));
      } catch (e) {
       // print('catch');
        emit(ContactsErrorState(e.toString()));
      }
    });
  }
}
