import 'package:flutter/material.dart';
import 'package:flutter_list_pagination/ui/views/paginated_list/paginated_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PaginatedListView extends StatelessWidget {
  const PaginatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaginatedListViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Paginated List Demo'),
          ),
          body: ListView.builder(
            // if hasMore is true, add one more space for a loading indicator
            itemCount: model.hasMore
                ? model.commentsList.length + 1
                : model.commentsList.length,
            itemBuilder: (context, index) {
              debugPrint('ListView.builder is building index $index');
              if (index >= model.commentsList.length) {
                // Don't trigger if one async loading is already under way
                if (!model.busy(commentsBusyKey)) {
                  model.loadMoreComments();
                }
                return Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 32, bottom: 32),
                    child: const SizedBox(
                      child: CircularProgressIndicator(),
                      height: 24,
                      width: 24,
                    ),
                  ),
                );
              }
              return ListTile(
                leading: Text(
                  '$index',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                title: Text(
                  '${model.commentsList[index].userComment}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text('From ${model.commentsList[index].userName}'),
              );
            },
          ),
        );
      },
      viewModelBuilder: () => PaginatedListViewModel(),
    );
  }
}
