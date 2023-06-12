class Post {
  String UserName;
  String IdName;
  String Text;
  String Images;
  String ImageProfile;
  bool isFavorite;
  bool isRetweet;
  bool isShare;
  bool isComment;

  Post(
      {required this.UserName,
      required this.IdName,
      required this.Images,
      required this.Text,
      required this.ImageProfile,
      required this.isFavorite,
      required this.isComment,
      required this.isRetweet,
      required this.isShare});
}
