part of 'firebase_crud_cubit.dart';

@immutable
abstract class FirebaseCrudState extends Equatable{}

final class FirebaseCrudInitial extends FirebaseCrudState {
  @override
  
  List<Object?> get props => [];
  
}

final class FirebaseCrudLoading extends FirebaseCrudState {
  @override
  
  List<Object?> get props => [];
  
}

final class FirebaseCrudLoaded extends FirebaseCrudState {

  final List<User> users;

  FirebaseCrudLoaded(this.users);
  

  @override
  
  List<Object?> get props => [users];
  
}

final class FirebaseCrudFailure extends FirebaseCrudState {
  @override
  
  List<Object?> get props => [];
  
}
