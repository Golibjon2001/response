
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/home/data/http_server.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeLoadState> {
  HomeBloc() : super(HomeLoadState(status: FormzStatus.pure, post:[], isDelete: false)) {
    on<HomeLoadPostEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final response =
          await Network.GET(Network.API_LIST, Network.paramsEmpty());
      if (response != null) {
        final posts = Network.parsePostList(response);
        emit(state.copyWith(status: FormzStatus.submissionSuccess,post:posts));
      }else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<HomeDelatePostEvent>((event, emit)async{
      emit(state.copyWith(status: FormzStatus.submissionInProgress, isDelete: false));
      final response =
      await Network.DEL(Network.API_DELETE+event.post!.id.toString(), Network.paramsEmpty());
      if(response!=null){
        //final posts = Network.parsePostList(response);
        emit(state.copyWith(status: FormzStatus.submissionSuccess, isDelete: true));
      }
    });
  }
}
