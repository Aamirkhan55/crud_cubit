import 'package:bloc/bloc.dart';
import 'package:crud_cubit/model/user_model.dart';
import 'package:crud_cubit/screens/database/database_hendler.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'firebase_crud_state.dart';

class FirebaseCrudCubit extends Cubit<FirebaseCrudState> {
  FirebaseCrudCubit() : super(FirebaseCrudInitial());

  void readData() {
    try {
      emit(FirebaseCrudLoading());
      final streamResponse = DatabaseHandler.readData();
      streamResponse.listen((users) {
        emit(FirebaseCrudLoaded(users));
       });
    } catch (e) {
      emit(FirebaseCrudFailure());
    }
  }

  void createData (User user) {
    if(state is FirebaseCrudLoaded) {
      DatabaseHandler.createData(user);
    }
  }

  void updateData (User user) {
    if(state is FirebaseCrudLoaded) {
      DatabaseHandler.updateData(user);
    }
  }


  void deleteData (String id) {
    if(state is FirebaseCrudLoaded) {
      DatabaseHandler.deleteData(id);
    }
  }
}
