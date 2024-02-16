class UserProfileModel {
  Data? data;
  String? message;

  UserProfileModel({this.data, this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? gender;
  String? academicTitle;
  String? timezone;
  String? calendarId;
  String? dob;
  String? contactNumber;
  String? idType;
  String? idCard;
  String? highestAcademicQualification;
  String? bio;
  Profession? profession;
  String? specialisation;
  String? avatar;
  String? status;
  String? statusVerifiedAt;
  Address? address;
  String? bank;
  bool? hasCompletedProfile;
  bool? hasCompletedPracticeDetails;
  bool? hasCompletedDocumentsUpload;
  bool? hasSetAvailability;
  bool? hasProfileVerified;
  bool? hasDocumentsVerified;
  bool? hasAvailabilityVerified;
  bool? hasDeviceCheckVerified;
  bool? hasBeenInterviewed;

  Data(
      {this.uuid,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.gender,
        this.academicTitle,
        this.timezone,
        this.calendarId,
        this.dob,
        this.contactNumber,
        this.idType,
        this.idCard,
        this.highestAcademicQualification,
        this.bio,
        this.profession,
        this.specialisation,
        this.avatar,
        this.status,
        this.statusVerifiedAt,
        this.address,
        this.bank,
        this.hasCompletedProfile,
        this.hasCompletedPracticeDetails,
        this.hasCompletedDocumentsUpload,
        this.hasSetAvailability,
        this.hasProfileVerified,
        this.hasDocumentsVerified,
        this.hasAvailabilityVerified,
        this.hasDeviceCheckVerified,
        this.hasBeenInterviewed});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    gender = json['gender'];
    academicTitle = json['academic_title'];
    timezone = json['timezone'];
    calendarId = json['calendar_id'];
    dob = json['dob'];
    contactNumber = json['contact_number'];
    idType = json['id_type'];
    idCard = json['id_card'];
    highestAcademicQualification = json['highest_academic_qualification'];
    bio = json['bio'];
    profession = json['profession'] != null
        ? new Profession.fromJson(json['profession'])
        : null;
    specialisation = json['specialisation'];
    avatar = json['avatar'];
    status = json['status'];
    statusVerifiedAt = json['status_verified_at'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    bank = json['bank'];
    hasCompletedProfile = json['has_completed_profile'];
    hasCompletedPracticeDetails = json['has_completed_practice_details'];
    hasCompletedDocumentsUpload = json['has_completed_documents_upload'];
    hasSetAvailability = json['has_set_availability'];
    hasProfileVerified = json['has_profile_verified'];
    hasDocumentsVerified = json['has_documents_verified'];
    hasAvailabilityVerified = json['has_availability_verified'];
    hasDeviceCheckVerified = json['has_device_check_verified'];
    hasBeenInterviewed = json['has_been_interviewed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['gender'] = this.gender;
    data['academic_title'] = this.academicTitle;
    data['timezone'] = this.timezone;
    data['calendar_id'] = this.calendarId;
    data['dob'] = this.dob;
    data['contact_number'] = this.contactNumber;
    data['id_type'] = this.idType;
    data['id_card'] = this.idCard;
    data['highest_academic_qualification'] = this.highestAcademicQualification;
    data['bio'] = this.bio;
    if (this.profession != null) {
      data['profession'] = this.profession!.toJson();
    }
    data['specialisation'] = this.specialisation;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['status_verified_at'] = this.statusVerifiedAt;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['bank'] = this.bank;
    data['has_completed_profile'] = this.hasCompletedProfile;
    data['has_completed_practice_details'] = this.hasCompletedPracticeDetails;
    data['has_completed_documents_upload'] = this.hasCompletedDocumentsUpload;
    data['has_set_availability'] = this.hasSetAvailability;
    data['has_profile_verified'] = this.hasProfileVerified;
    data['has_documents_verified'] = this.hasDocumentsVerified;
    data['has_availability_verified'] = this.hasAvailabilityVerified;
    data['has_device_check_verified'] = this.hasDeviceCheckVerified;
    data['has_been_interviewed'] = this.hasBeenInterviewed;
    return data;
  }
}

class Profession {
  String? name;
  String? slug;

  Profession({this.name, this.slug});

  Profession.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Address {
  Addressable? addressable;
  String? line1;
  String? line2;
  String? city;
  String? postcode;
  String? country;

  Address(
      {this.addressable,
        this.line1,
        this.line2,
        this.city,
        this.postcode,
        this.country});

  Address.fromJson(Map<String, dynamic> json) {
    addressable = json['addressable'] != null
        ? new Addressable.fromJson(json['addressable'])
        : null;
    line1 = json['line_1'];
    line2 = json['line_2'];
    city = json['city'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressable != null) {
      data['addressable'] = this.addressable!.toJson();
    }
    data['line_1'] = this.line1;
    data['line_2'] = this.line2;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}

class Addressable {
  int? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? gender;
  String? academicTitle;
  String? specialisation;
  int? professionId;
  String? dob;
  String? contactNumber;
  String? idType;
  String? highestAcademicQualification;
  Null? bio;
  Null? calendlyUrl;
  String? timezone;
  String? calendarId;
  Null? meta;
  String? status;
  Null? statusVerifiedAt;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Profession? profession;
  Address? address;
  Null? bank;

  Addressable(
      {this.id,
        this.uuid,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.gender,
        this.academicTitle,
        this.specialisation,
        this.professionId,
        this.dob,
        this.contactNumber,
        this.idType,
        this.highestAcademicQualification,
        this.bio,
        this.calendlyUrl,
        this.timezone,
        this.calendarId,
        this.meta,
        this.status,
        this.statusVerifiedAt,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.profession,
        this.address,
        this.bank});

  Addressable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    gender = json['gender'];
    academicTitle = json['academic_title'];
    specialisation = json['specialisation'];
    professionId = json['profession_id'];
    dob = json['dob'];
    contactNumber = json['contact_number'];
    idType = json['id_type'];
    highestAcademicQualification = json['highest_academic_qualification'];
    bio = json['bio'];
    calendlyUrl = json['calendly_url'];
    timezone = json['timezone'];
    calendarId = json['calendar_id'];
    meta = json['meta'];
    status = json['status'];
    statusVerifiedAt = json['status_verified_at'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];

    profession = json['profession'] != null
        ? new Profession.fromJson(json['profession'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['academic_title'] = this.academicTitle;
    data['specialisation'] = this.specialisation;
    data['profession_id'] = this.professionId;
    data['dob'] = this.dob;
    data['contact_number'] = this.contactNumber;
    data['id_type'] = this.idType;
    data['highest_academic_qualification'] = this.highestAcademicQualification;
    data['bio'] = this.bio;
    data['calendly_url'] = this.calendlyUrl;
    data['timezone'] = this.timezone;
    data['calendar_id'] = this.calendarId;
    data['meta'] = this.meta;
    data['status'] = this.status;
    data['status_verified_at'] = this.statusVerifiedAt;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;

    if (this.profession != null) {
      data['profession'] = this.profession!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['bank'] = this.bank;
    return data;
  }
}


