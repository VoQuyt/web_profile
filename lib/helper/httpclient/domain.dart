enum DomainMode { dev, stag, prod }

enum SocketChannel { Pro_Update, Dev_Update }

class Domain {
  // Domain._privateConstructor();
  // static final Domain instance = Domain._privateConstructor();
  static const String baseUrl =
      //"http://localhost:8080/";
      "https://api.selzy.com/en/api/sendEmail";
  static const String assetUrl = "https://ik.imagekit.io/qavoxs3/qavox-site";
  static const String token = "67xgwj8it16xfop8eyd55dqn915aagzghq3txyyo";
  static const String keyEmail = '67xgwj8it16xfop8eyd55dqn915aagzghq3txyyo';
  static const String gitHubToken = "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";
}
