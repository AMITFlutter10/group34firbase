part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class SelectPhotoState extends AppState {}
class AuthEmailAndPasswordState extends AppState {}
class SaveUsersState extends AppState {}
class LoginEmailAndPasswordState extends AppState {}
class GetUsersState extends AppState {}

