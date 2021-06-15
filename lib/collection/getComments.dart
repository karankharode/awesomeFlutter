Future<void> getComments(int courseIndex, int categoryIndex) async {
  await databaseReference
      .child("Courses")
      .child(categoryNames[widget.index])
      .child(categoryList[categoryIndex]
          .courseDataListModelList[courseIndex]
          .courseId)
      .child("Comments")
      .once()
      .then((DataSnapshot value) {
    if (value.value != null) {
      commentsList.clear();

      List<dynamic> commentsSnap = value.value;
      setState(() {
        isCommentsEmpty = false;
        commentsSnap.forEach((element) {
          if (element != null) {
            commentsList.add(new Comments(
                element['comment'], element['date_time'], element['uid']));
          }
        });
      });
    } else {
      setState(() {
        isCommentsEmpty = false;
      });
    }
  });
}
