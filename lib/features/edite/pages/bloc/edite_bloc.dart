
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/home/data/http_server.dart';
import 'package:meta/meta.dart';
part 'edite_event.dart';
part 'edite_state.dart';

class EditeBloc extends Bloc<EditeEvent, EditeState> {
  EditeBloc()
      : super(
            EditeState(isEdit:false, status: FormzStatus.pure, post: Post())) {
    on<EditePostEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final respons = await Network.PUT(
          Network.API_UPDATE + event.post.id.toString(),
          Network.paramsUpdate(event.post));
      if (respons != null) {
        Post post = Network.parsePost(respons);
        emit(state.copyWith(status: FormzStatus.submissionSuccess,post:post,isEdit:true));
      }
    });
  }
}
