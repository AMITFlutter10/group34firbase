import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
static  AppCubit get(context)=> BlocProvider.of(context);
ImagePicker imagePicker =ImagePicker();
UserModel registerUser = UserModel();
FirebaseStorage firebaseStorage=FirebaseStorage.instance;
FirebaseAuth auth =FirebaseAuth.instance;
FirebaseFirestore store =FirebaseFirestore.instance;
XFile? userImage;
Image(String camera)async {
  try {
    if (camera == "cam") {
      userImage = await imagePicker.pickImage(
          source: ImageSource.camera);
      await firebaseStorage.ref().child("images/")
          .child("${registerUser.id}").putFile(File(userImage!.path));
      emit(SelectPhotoState());
      registerUser.photo =   await firebaseStorage.ref().child("images/")
          .child("${registerUser.id}").getDownloadURL();
      print( registerUser.photo);
      return userImage!.readAsBytes();

    } else if (camera == "gallery") {
        userImage = await imagePicker.pickImage(
            source: ImageSource.gallery);
        await firebaseStorage.ref().child("images/")
            .child("image.png").putFile(File(userImage!.path));
        emit(SelectPhotoState());
      }
  } catch (error) {
    print(error);
  }
}



registerByEmailAndPassword(String email,String name, String password)async{
 UserCredential userRegister =await auth.createUserWithEmailAndPassword(email: email, password: password);
  emit(AuthEmailAndPasswordState());
  registerUser.name= name;
  registerUser.email =email;
  registerUser.password=password;
  registerUser.id = userRegister.user!.uid;
  await firebaseStorage.ref().child("images/").
   child("${registerUser.id}").putFile(File(userImage!.path));
 registerUser.photo =await firebaseStorage.ref().child("images/").
 child("${registerUser.id}").getDownloadURL();
 await store.collection("users").doc(registerUser.id).set(registerUser.toJson());
 emit(SaveUsersState());

}

loginByEmailAndPassword(String email, String password)async{
    UserCredential userRegister =await auth.signInWithEmailAndPassword(email: email, password: password);
    emit(LoginEmailAndPasswordState());
    registerUser.email =email;
    registerUser.password=password;
    registerUser.id = userRegister.user!.uid;
    await firebaseStorage.ref().child("images/").
    child("${registerUser.id}").putFile(File(userImage!.path));
    registerUser.photo =await firebaseStorage.ref().child("images/").
    child("${registerUser.id}").getDownloadURL();
    await store.collection("users").doc(registerUser.id).set(registerUser.toJson());
    emit(GetUsersState());

  }

}
