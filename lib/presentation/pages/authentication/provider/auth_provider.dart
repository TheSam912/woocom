import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// FirebaseAuth instance provider
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(firebaseAuthProvider));
});

final authStateProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  User? user = auth.currentUser;
  if (user == null) return null;

  // Fetch user role from Firestore
  DocumentSnapshot userDoc =
      await firestore.collection("users").doc(user.uid).get();

  if (!userDoc.exists) {
    return null; // User data is missing in Firestore
  }

  String role = userDoc["role"] ?? "user"; // Default to 'user'

  return {
    "user": user,
    "role": role,
  };
});

// Auth Repository
class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

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
        // Check if it's the first user (assign admin role)
        QuerySnapshot allUsers =
            await FirebaseFirestore.instance.collection("user").get();
        String role = allUsers.docs.isEmpty ? "admin" : "user";

        // Save user data in Firestore
        await FirebaseFirestore.instance.collection("user").doc(user.uid).set({
          "uid": user.uid,
          "email": email,
          "role": role,
          "createdAt": FieldValue.serverTimestamp(),
        });

        return user;
      }
    } catch (e) {
      throw Exception("Sign Up Failed: $e");
    }
    return null;
  }

  Future<User?> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      throw Exception("Sign In Failed: $e");
    }
  }

// Password Reset
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception("Password Reset Failed: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
