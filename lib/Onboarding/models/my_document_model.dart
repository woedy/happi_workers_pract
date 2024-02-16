class MyDocumentModel {
  Data? data;

  MyDocumentModel({this.data});

  MyDocumentModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? fileName;
  String? disk;
  String? conversionsDisk;
  String? collectionName;
  String? mimeType;
  int? size;
  List<Null>? customProperties;
  List<Null>? generatedConversions;
  List<Null>? responsiveImages;
  List<Null>? manipulations;
  int? modelId;
  String? modelType;
  String? uuid;
  int? orderColumn;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? originalUrl;
  String? previewUrl;

  Data(
      {this.name,
        this.fileName,
        this.disk,
        this.conversionsDisk,
        this.collectionName,
        this.mimeType,
        this.size,
        this.customProperties,
        this.generatedConversions,
        this.responsiveImages,
        this.manipulations,
        this.modelId,
        this.modelType,
        this.uuid,
        this.orderColumn,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.originalUrl,
        this.previewUrl});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fileName = json['file_name'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    collectionName = json['collection_name'];
    mimeType = json['mime_type'];
    size = json['size'];


    modelId = json['model_id'];
    modelType = json['model_type'];
    uuid = json['uuid'];
    orderColumn = json['order_column'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['disk'] = this.disk;
    data['conversions_disk'] = this.conversionsDisk;
    data['collection_name'] = this.collectionName;
    data['mime_type'] = this.mimeType;
    data['size'] = this.size;

    data['model_id'] = this.modelId;
    data['model_type'] = this.modelType;
    data['uuid'] = this.uuid;
    data['order_column'] = this.orderColumn;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['original_url'] = this.originalUrl;
    data['preview_url'] = this.previewUrl;
    return data;
  }
}
