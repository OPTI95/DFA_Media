import 'package:bloc/bloc.dart';
import 'package:dfa_media/features/products/domain/entities/stories/stories_entity.dart';
import 'package:dfa_media/features/products/domain/usecases/get_stories.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utlis/usecase/usecase.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStories _getStories;
  StoryBloc({required GetStories getStories}) : _getStories = getStories,
        super(StoryState(status: StoryStatus.initial)) {
    on<LoadStory>(_onLoadStory);
  }
    Future<void> _onLoadStory(LoadStory event, Emitter<StoryState> emit) async {
    try {
      if (state.status != StoryStatus.loaded) {
        emit(state.copyWith(status: StoryStatus.loading));
      }
      final data = await _getStories.call(params: NoParams());
      data.fold(
        (error) => emit(state.copyWith(status: StoryStatus.error)),
        (data) {        
          emit(state.copyWith(status: StoryStatus.loaded, storyes: data));},
      );
    } catch (error) {
      emit(state.copyWith(status: StoryStatus.error));
    }
  }
}
