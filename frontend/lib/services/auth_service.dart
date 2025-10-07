import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🔹 Register new user with email & password
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;

      if (user != null) {
        await _saveUserToFirestore(user);
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🔹 Login existing user with email & password
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🔹 Logout user
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// 🔹 Get current user
  User? get currentUser => _auth.currentUser;

  /// 🔹 Listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// 🔹 Save user info to Firestore
  Future<void> _saveUserToFirestore(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);

    final snapshot = await userDoc.get();
    if (!snapshot.exists) {
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName ?? '',
        'photoURL': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  /// 🔹 Map FirebaseAuthException codes to readable messages
  String _handleError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}
