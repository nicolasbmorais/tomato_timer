import 'package:bloc/bloc.dart';
import 'package:tomato_timer/src/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotesModel> notesModeList = [];
  bool isSelected = false;

  void saveNotes({required String title, required String description}) {
    final newNote = NotesModel(
      title: title,
      description: description,
    );
    notesModeList.add(newNote);
    emit(NotesLoaded());
  }

  void removeNote(int index) {
    notesModeList.removeAt(index);
    emit(NotesLoaded());
  }

  void selectNote({required bool? value}) {
    isSelected = value!;
    emit(NotesLoaded());
  }
}
