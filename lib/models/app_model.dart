import 'package:web_profile/helper/httpclient/domain.dart';

class AppModel {
  final String appName;
  final String des;
  final String appIcon;
  final List<String> images;
  AppModel({
    required this.appName,
    required this.des,
    required this.appIcon,
    required this.images,
  });
}

final List<AppModel> dataApps = [
  dataDecloset,
  dataUnigWork,
  dataKogi,
  dataBreadking
];

final AppModel dataDecloset = AppModel(
    appName: 'DeCloset',
    des: '',
    appIcon: '${Domain.assetUrl}/decloset/icon.png',
    images: [
      '${Domain.assetUrl}/decloset/decloset_0.png',
      '${Domain.assetUrl}/decloset/decloset_1.png',
      '${Domain.assetUrl}/decloset/decloset_2.png',
      '${Domain.assetUrl}/decloset/decloset_3.png',
      '${Domain.assetUrl}/decloset/decloset_4.png',
      '${Domain.assetUrl}/decloset/decloset_5.png',
      '${Domain.assetUrl}/decloset/decloset_6.png',
    ]);

final AppModel dataUnigWork = AppModel(
    appName: 'UnigWork',
    des: '',
    appIcon: '${Domain.assetUrl}/unigwork/icon.png',
    images: [
      '${Domain.assetUrl}/unigwork/unigwork_0.png',
      '${Domain.assetUrl}/unigwork/unigwork_1.png',
      '${Domain.assetUrl}/unigwork/unigwork_2.png',
      '${Domain.assetUrl}/unigwork/unigwork_3.png',
      '${Domain.assetUrl}/unigwork/unigwork_4.png',
      '${Domain.assetUrl}/unigwork/unigwork_5.png',
    ]);

final AppModel dataKogi = AppModel(
    appName: 'KogiStore',
    des: '',
    appIcon: '${Domain.assetUrl}/kogistore/icon.png',
    images: [
      '${Domain.assetUrl}/kogistore/kogi_1.jpg',
      '${Domain.assetUrl}/kogistore/kogi_2.jpg',
      '${Domain.assetUrl}/kogistore/kogi_3.jpg',
      '${Domain.assetUrl}/kogistore/kogi_4.jpg',
      '${Domain.assetUrl}/kogistore/kogi_5.jpg',
      '${Domain.assetUrl}/kogistore/kogi_6.jpg',
      '${Domain.assetUrl}/kogistore/kogi_7.jpg',
      '${Domain.assetUrl}/kogistore/kogi_8.jpg',
    ]);

final AppModel dataBreadking = AppModel(
    appName: 'Breadking',
    des: '',
    appIcon: '${Domain.assetUrl}/icon.png',
    images: [
      '${Domain.assetUrl}/breadking/breadking_1.png',
      '${Domain.assetUrl}/breadking/breadking_2.png',
      '${Domain.assetUrl}/breadking/breadking_3.png',
    ]);
