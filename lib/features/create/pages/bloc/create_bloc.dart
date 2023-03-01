

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/home/data/http_server.dart';
import 'package:meta/meta.dart';

part 'create_event.dart';

part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateState(status: FormzStatus.pure, post: Post())) {
    on<CreatePostEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final respons = await Network.POST(
          Network.API_CREATE, Network.paramsCreate(event.post));
      if (respons != null) {
        Post post = Network.parsePost(respons);
        emit(state.copyWith(status: FormzStatus.submissionSuccess, post: post));
      }
    });
  }
}
