import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());
  Future<void> fetch_regester({
    required String email,
    required String password,
  }) async {
    emit(RegesterLoadingState());
    try {
      var authRegester = FirebaseAuth.instance;
      UserCredential user = await authRegester.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegesterSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex == "weak-password") {
        emit(RegesterFailureState(errorMassage: 'weak-password'));
      }
      if (ex == "email-already-in-use") {
        emit(RegesterFailureState(errorMassage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(
        RegesterFailureState(
          errorMassage: "there was an error please try again",
        ),
      );
    }
  }
}
