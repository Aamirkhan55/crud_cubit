import 'package:crud_cubit/cubit/firebase_crud_cubit.dart';
import 'package:crud_cubit/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Crud'),
      ),
        body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
               BlocProvider.of<FirebaseCrudCubit>(context).createData(
                User(
                  email: 'Alikhan1234@gmail.com',
                  username: 'Ali Khan',
                )
               );
              }, 
              child: const Text('Creat Data ')
              ),
          ),
          BlocBuilder<FirebaseCrudCubit, FirebaseCrudState>(
            builder: (context, state) {
              if(state is FirebaseCrudLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is FirebaseCrudFailure) {
                return const Center(
                  child: Text('Something is wrong')
                  );
              }
              if(state is FirebaseCrudLoaded) {
                final users = state.users;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: users.map((user) {
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            BlocProvider.of<FirebaseCrudCubit>(context)
                            .deleteData(user.id!);
                          },
                         child: const Icon(Icons.delete), 
                        ),
                        trailing: GestureDetector(
                          onTap:  () {
                            BlocProvider.of<FirebaseCrudCubit>(context)
                            .updateData(
                              User(
                              id: user.id,  
                              username: 'Jhon King',
                              email: 'JhonKing123@gmail.com',
                            ));
                          },
                          child: const Icon(Icons.update),
                        ),
                        title: Text(user.username!),
                        subtitle: Text(user.email!),
                      );
                    }).toList(),
                  ),
                  );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            ),
        ],
      ),
    );
  }
}