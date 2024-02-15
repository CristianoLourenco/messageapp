import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messageapp/models/message_model.dart';
import 'package:messageapp/models/user_model.dart';

final getFirebaseMessage = FirebaseFirestore.instance
    .collection('messages')
    .withConverter<MessageModel>(
      fromFirestore: (snapshot, options) => MessageModel.fromJson(
        snapshot.data(),
      ),
      toFirestore: (value, options) => value.toJson(),
    );

final getFirebaseUsers =
    FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, options) => UserModel.fromJson(
            snapshot.id,
            snapshot.data(),
          ),
          toFirestore: (value, options) => value.toJson(),
        );
