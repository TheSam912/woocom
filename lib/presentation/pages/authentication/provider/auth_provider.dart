import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// FirebaseAuth instance provider
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Firestore instance provider
final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(firebaseAuthProvider),
    ref.read(firestoreProvider),
  );
});

final authStateProvider = StreamProvider<Map<String, dynamic>?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final fireStore = ref.watch(firestoreProvider);

  return auth.authStateChanges().asyncMap((user) async {
    if (user == null) return null;

    DocumentSnapshot userDoc =
        await fireStore.collection("users").doc(user.uid).get();

    if (!userDoc.exists) return null;

    return {
      "user": user,
      "role": userDoc["role"] ?? "user",
    };
  });
});

// Auth Repository
class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository(this._auth, this._firestore);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        QuerySnapshot allUsers = await _firestore.collection("users").get();
        String role = allUsers.docs.isEmpty ? "admin" : "user";

        await _firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "email": email,
          "role": role,
          "createdAt": FieldValue.serverTimestamp(),
        });

        return user;
      }
    } catch (e) {
      throw Exception("Sign Up Failed: ${e.toString()}");
    }
    return null;
  }

  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null; // No need to return data, UI updates via StreamProvider
    } catch (e) {
      throw Exception("Sign In Failed: ${e.toString()}");
    }
  }

  // Future<Map<String, dynamic>?> signIn(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //
  //     User? user = userCredential.user;
  //     if (user == null) return null;
  //
  //     DocumentSnapshot userDoc =
  //         await _firestore.collection("users").doc(user.uid).get();
  //
  //     if (!userDoc.exists) return null;
  //
  //     return {
  //       "user": user,
  //       "role": userDoc["role"] ?? "user",
  //     };
  //   } catch (e) {
  //     throw Exception("Sign In Failed: ${e.toString()}");
  //   }
  // }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception("Password Reset Failed: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updateUserRole(String uid, String newRole) async {
    try {
      await _firestore.collection("users").doc(uid).update({
        "role": newRole,
      });
    } catch (e) {
      throw Exception("Role Update Failed: ${e.toString()}");
    }
  }
}
