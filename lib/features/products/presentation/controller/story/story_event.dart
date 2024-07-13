part of 'story_bloc.dart';

sealed class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object> get props => [];
}
class LoadStory extends StoryEvent {
  @override
  List<Object> get props => [];
}