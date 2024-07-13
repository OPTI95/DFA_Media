part of 'story_bloc.dart';
enum StoryStatus { initial, loading, loaded, error }

final class StoryState {
  final StoryStatus status;
  final List<StoriesEntity> storyes;

  StoryState({
    this.status = StoryStatus.initial,
    this.storyes = const [],
  });

  StoryState copyWith({
    StoryStatus? status,
    List<StoriesEntity>? storyes,
  }) {
    return StoryState(
      status: status ?? this.status,
      storyes: storyes ?? this.storyes
    );
  }
}