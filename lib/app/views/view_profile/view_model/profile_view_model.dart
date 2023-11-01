import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_profile/view_model/profile_event.dart';
import 'package:irecipe/app/views/view_profile/view_model/profile_state.dart';


class ProfileViewModel extends Bloc<ProfileEvent, ProfileState> {
  ProfileViewModel() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(_initial);
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<FutureOr<void>> _initial(
      ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    await firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        emit(ProfileInitialState(
            name: documentSnapshot['name'],
            surname: documentSnapshot['surname'],
            email: documentSnapshot['email']));
      }
    });
  }
}
