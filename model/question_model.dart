class QuestionModel{
  const QuestionModel({required this.ques,required this.ans});

  final String ques;
  final List<String> ans;

  List<String> shuffledata(){
    final shuffledlist = List.of(ans);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}