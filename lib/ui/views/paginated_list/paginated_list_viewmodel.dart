import 'package:flutter_list_pagination/app/app.locator.dart';
import 'package:flutter_list_pagination/app/app.logger.dart';
import 'package:flutter_list_pagination/models/comments_model.dart';
import 'package:flutter_list_pagination/services/comments/comments_service.dart';
import 'package:stacked/stacked.dart';

const commentsBusyKey = 'comments';

class PaginatedListViewModel extends BaseViewModel {
  final log = getLogger('PaginatedListViewModel');
  final commentsService = locator<CommentsService>();

  int currentPage = 0;

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  final List<Comments> _commentsList = [];

  List<Comments> get commentsList => _commentsList;

  void setup() async {
    await loadMoreComments();
  }

  Future<void> loadMoreComments() async {
    await commentsService.getComments(currentPage: currentPage).then(
      (List<Comments>? fetchedCommentsList) {
        // check if there's still data
        if (fetchedCommentsList!.isEmpty) {
          _hasMore = false;
          setBusyForObject(commentsBusyKey, false);
        } else {
          currentPage++;
          _commentsList.addAll(fetchedCommentsList);
          setBusyForObject(commentsBusyKey, false);
        }
      },
    );
    log.i('Has more $_hasMore');
  }
}
