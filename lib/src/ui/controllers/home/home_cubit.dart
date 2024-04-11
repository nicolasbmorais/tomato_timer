import 'package:bloc/bloc.dart';
import 'package:tomato_timer/src/data/models/notes_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<NotesModel> notesModeList = [];

  void saveNotes({required String title, required String description}) {
    final newNote = NotesModel(
      title: title,
      description: description,
    );
    notesModeList.add(newNote);
    emit(HomeLoaded());
  }

  void removeNote(int index) {
    notesModeList.removeAt(index);
    emit(HomeLoaded());

  }
}
