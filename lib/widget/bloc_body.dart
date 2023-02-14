import 'package:flutter/material.dart';
import '../bloc/contacts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/home_repository.dart';
import '../model/usermodel.dart';

class BlocBody extends StatelessWidget {
  const BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  Widget blocBody() {
    return BlocProvider(
      create: (context) => ContactsBloc(
        HomeRepository(),
      )..add(FetchApiEvent()),
      child: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is ContactsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is ContactsLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  userList[index].id,
                                  style: const TextStyle(color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  ' ${userList[index].name}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),

                            subtitle: Text(
                              userList[index].contacts,
                              style: const TextStyle(color: Colors.pinkAccent),
                            ),
                            
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].url.toString()),
                            ))),
                  );
                });
          }
          if (state is ContactsErrorState) {
            return const Center(child:  Text("Error"));
          }
          return Container();
        },
      ),
    );
 // }
  }
}