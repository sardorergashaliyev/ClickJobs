class GetProfile {
  Application? application;
  User? user;

  GetProfile({this.application, this.user});

  GetProfile.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null
        ? Application.fromJson(json['application'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (application != null) {
      data['application'] = application!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Application {
  List<AcademicTests>? academicTests;
  List<Awards>? awards;
  CheckedSteps? checkedSteps;
  List<Educations>? educations;
  List<Languages>? languages;
  List<Licences>? licences;
  List<Researches>? researches;
  List<Skills>? skills;
  List<WorkExperiences>? workExperiences;

  Application(
      {this.academicTests,
      this.awards,
      this.checkedSteps,
      this.educations,
      this.languages,
      this.licences,
      this.researches,
      this.skills,
      this.workExperiences});

  Application.fromJson(Map<String, dynamic> json) {
    if (json['academic_tests'] != null) {
      academicTests = <AcademicTests>[];
      json['academic_tests'].forEach((v) {
        academicTests!.add(AcademicTests.fromJson(v));
      });
    }
    if (json['awards'] != null) {
      awards = <Awards>[];
      json['awards'].forEach((v) {
        awards!.add(Awards.fromJson(v));
      });
    }
    checkedSteps = json['checked_steps'] != null
        ? CheckedSteps.fromJson(json['checked_steps'])
        : null;
    if (json['educations'] != null) {
      educations = <Educations>[];
      json['educations'].forEach((v) {
        educations!.add(Educations.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['licences'] != null) {
      licences = <Licences>[];
      json['licences'].forEach((v) {
        licences!.add(Licences.fromJson(v));
      });
    }
    if (json['researches'] != null) {
      researches = <Researches>[];
      json['researches'].forEach((v) {
        researches!.add(Researches.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['work_experiences'] != null) {
      workExperiences = <WorkExperiences>[];
      json['work_experiences'].forEach((v) {
        workExperiences!.add(WorkExperiences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (academicTests != null) {
      data['academic_tests'] =
          academicTests!.map((v) => v.toJson()).toList();
    }
    if (awards != null) {
      data['awards'] = awards!.map((v) => v.toJson()).toList();
    }
    if (checkedSteps != null) {
      data['checked_steps'] = checkedSteps!.toJson();
    }
    if (educations != null) {
      data['educations'] = educations!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (licences != null) {
      data['licences'] = licences!.map((v) => v.toJson()).toList();
    }
    if (researches != null) {
      data['researches'] = researches!.map((v) => v.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (workExperiences != null) {
      data['work_experiences'] =
          workExperiences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AcademicTests {
  int? applicantId;
  int? id;
  String? organization;
  String? pdfUrl;
  int? score;
  String? testName;

  AcademicTests(
      {this.applicantId,
      this.id,
      this.organization,
      this.pdfUrl,
      this.score,
      this.testName});

  AcademicTests.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
    score = json['score'];
    testName = json['test_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['id'] = id;
    data['organization'] = organization;
    data['pdf_url'] = pdfUrl;
    data['score'] = score;
    data['test_name'] = testName;
    return data;
  }
}

class Awards {
  int? applicantId;
  String? awardName;
  int? id;
  String? organization;
  String? pdfUrl;

  Awards(
      {this.applicantId,
      this.awardName,
      this.id,
      this.organization,
      this.pdfUrl});

  Awards.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    awardName = json['award_name'];
    id = json['id'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['award_name'] = awardName;
    data['id'] = id;
    data['organization'] = organization;
    data['pdf_url'] = pdfUrl;
    return data;
  }
}

class CheckedSteps {
  bool? academicTest;
  int? applicantId;
  bool? award;
  bool? education;
  bool? generalInfo;
  int? id;
  bool? licencesCertificate;
  bool? research;
  bool? work;

  CheckedSteps(
      {this.academicTest,
      this.applicantId,
      this.award,
      this.education,
      this.generalInfo,
      this.id,
      this.licencesCertificate,
      this.research,
      this.work});

  CheckedSteps.fromJson(Map<String, dynamic> json) {
    academicTest = json['academic_test'];
    applicantId = json['applicant_id'];
    award = json['award'];
    education = json['education'];
    generalInfo = json['general_info'];
    id = json['id'];
    licencesCertificate = json['licences_certificate'];
    research = json['research'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['academic_test'] = academicTest;
    data['applicant_id'] = applicantId;
    data['award'] = award;
    data['education'] = education;
    data['general_info'] = generalInfo;
    data['id'] = id;
    data['licences_certificate'] = licencesCertificate;
    data['research'] = research;
    data['work'] = work;
    return data;
  }
}

class Educations {
  int? applicantGrade;
  int? applicantId;
  String? degreeLevel;
  String? degreeName;
  String? endYear;
  int? id;
  int? maxGrade;
  String? pdfUrl;
  String? startYear;
  String? university;

  Educations(
      {this.applicantGrade,
      this.applicantId,
      this.degreeLevel,
      this.degreeName,
      this.endYear,
      this.id,
      this.maxGrade,
      this.pdfUrl,
      this.startYear,
      this.university});

  Educations.fromJson(Map<String, dynamic> json) {
    applicantGrade = json['applicant_grade'];
    applicantId = json['applicant_id'];
    degreeLevel = json['degree_level'];
    degreeName = json['degree_name'];
    endYear = json['end_year'];
    id = json['id'];
    maxGrade = json['max_grade'];
    pdfUrl = json['pdf_url'];
    startYear = json['start_year'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_grade'] = applicantGrade;
    data['applicant_id'] = applicantId;
    data['degree_level'] = degreeLevel;
    data['degree_name'] = degreeName;
    data['end_year'] = endYear;
    data['id'] = id;
    data['max_grade'] = maxGrade;
    data['pdf_url'] = pdfUrl;
    data['start_year'] = startYear;
    data['university'] = university;
    return data;
  }
}

class Languages {
  int? applicantId;
  int? id;
  String? language;
  String? level;

  Languages({this.applicantId, this.id, this.language, this.level});

  Languages.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    language = json['language'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['id'] = id;
    data['language'] = language;
    data['level'] = level;
    return data;
  }
}

class Licences {
  int? applicantId;
  int? id;
  String? licenceName;
  String? organization;
  String? pdfUrl;

  Licences(
      {this.applicantId,
      this.id,
      this.licenceName,
      this.organization,
      this.pdfUrl});

  Licences.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    licenceName = json['licence_name'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['id'] = id;
    data['licence_name'] = licenceName;
    data['organization'] = organization;
    data['pdf_url'] = pdfUrl;
    return data;
  }
}

class Researches {
  int? applicantId;
  String? description;
  int? id;
  String? organizationName;
  String? position;
  String? superviser;
  String? superviserEmail;

  Researches(
      {this.applicantId,
      this.description,
      this.id,
      this.organizationName,
      this.position,
      this.superviser,
      this.superviserEmail});

  Researches.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    description = json['description'];
    id = json['id'];
    organizationName = json['organization_name'];
    position = json['position'];
    superviser = json['superviser'];
    superviserEmail = json['superviser_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['description'] = description;
    data['id'] = id;
    data['organization_name'] = organizationName;
    data['position'] = position;
    data['superviser'] = superviser;
    data['superviser_email'] = superviserEmail;
    return data;
  }
}

class Skills {
  int? applicantId;
  int? id;
  String? skill;

  Skills({this.applicantId, this.id, this.skill});

  Skills.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['id'] = id;
    data['skill'] = skill;
    return data;
  }
}

class WorkExperiences {
  int? applicantId;
  String? companyName;
  String? companyWebsite;
  String? description;
  String? employmentType;
  String? endMonth;
  String? endYear;
  int? id;
  String? startMonth;
  String? startYear;
  String? workPosition;

  WorkExperiences(
      {this.applicantId,
      this.companyName,
      this.companyWebsite,
      this.description,
      this.employmentType,
      this.endMonth,
      this.endYear,
      this.id,
      this.startMonth,
      this.startYear,
      this.workPosition});

  WorkExperiences.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    companyName = json['company_name'];
    companyWebsite = json['company_website'];
    description = json['description'];
    employmentType = json['employment_type'];
    endMonth = json['end_month'];
    endYear = json['end_year'];
    id = json['id'];
    startMonth = json['start_month'];
    startYear = json['start_year'];
    workPosition = json['work_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['company_name'] = companyName;
    data['company_website'] = companyWebsite;
    data['description'] = description;
    data['employment_type'] = employmentType;
    data['end_month'] = endMonth;
    data['end_year'] = endYear;
    data['id'] = id;
    data['start_month'] = startMonth;
    data['start_year'] = startYear;
    data['work_position'] = workPosition;
    return data;
  }
}

class User {
  String? bio;
  List<BlockedOrganizations>? blockedOrganizations;
  String? city;
  String? country;
  String? dateOfBirth;
  String? email;
  String? fullName;
  int? id;
  String? imageUrl;
  bool? invisibleAge;
  String? lang;
  String? lastStep;
  String? phoneNumber;
  String? profession;
  String? role;
  List<SocialMedias>? socialMedias;

  User(
      {this.bio,
      this.blockedOrganizations,
      this.city,
      this.country,
      this.dateOfBirth,
      this.email,
      this.fullName,
      this.id,
      this.imageUrl,
      this.invisibleAge,
      this.lang,
      this.lastStep,
      this.phoneNumber,
      this.profession,
      this.role,
      this.socialMedias});

  User.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    if (json['blocked_organizations'] != null) {
      blockedOrganizations = <BlockedOrganizations>[];
      json['blocked_organizations'].forEach((v) {
        blockedOrganizations!.add(BlockedOrganizations.fromJson(v));
      });
    }
    city = json['city'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    fullName = json['full_name'];
    id = json['id'];
    imageUrl = json['image_url'];
    invisibleAge = json['invisible_age'];
    lang = json['lang'];
    lastStep = json['last_step'];
    phoneNumber = json['phone_number'];
    profession = json['profession'];
    role = json['role'];
    if (json['social_medias'] != null) {
      socialMedias = <SocialMedias>[];
      json['social_medias'].forEach((v) {
        socialMedias!.add(SocialMedias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bio'] = bio;
    if (blockedOrganizations != null) {
      data['blocked_organizations'] =
          blockedOrganizations!.map((v) => v.toJson()).toList();
    }
    data['city'] = city;
    data['country'] = country;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['full_name'] = fullName;
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['invisible_age'] = invisibleAge;
    data['lang'] = lang;
    data['last_step'] = lastStep;
    data['phone_number'] = phoneNumber;
    data['profession'] = profession;
    data['role'] = role;
    if (socialMedias != null) {
      data['social_medias'] =
          socialMedias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlockedOrganizations {
  int? applicantId;
  int? companyId;
  CompanyInfo? companyInfo;
  String? createdAt;
  int? id;

  BlockedOrganizations(
      {this.applicantId,
      this.companyId,
      this.companyInfo,
      this.createdAt,
      this.id});

  BlockedOrganizations.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    companyId = json['company_id'];
    companyInfo = json['company_info'] != null
        ? CompanyInfo.fromJson(json['company_info'])
        : null;
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['company_id'] = companyId;
    if (companyInfo != null) {
      data['company_info'] = companyInfo!.toJson();
    }
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class CompanyInfo {
  String? city;
  String? companyName;
  String? country;
  String? createdAt;
  String? description;
  String? email;
  String? imageUrl;
  String? phoneNumber;
  String? workersCount;

  CompanyInfo(
      {this.city,
      this.companyName,
      this.country,
      this.createdAt,
      this.description,
      this.email,
      this.imageUrl,
      this.phoneNumber,
      this.workersCount});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    companyName = json['company_name'];
    country = json['country'];
    createdAt = json['created_at'];
    description = json['description'];
    email = json['email'];
    imageUrl = json['image_url'];
    phoneNumber = json['phone_number'];
    workersCount = json['workers_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['company_name'] = companyName;
    data['country'] = country;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['email'] = email;
    data['image_url'] = imageUrl;
    data['phone_number'] = phoneNumber;
    data['workers_count'] = workersCount;
    return data;
  }
}

class SocialMedias {
  int? applicantId;
  int? id;
  String? name;
  String? url;

  SocialMedias({this.applicantId, this.id, this.name, this.url});

  SocialMedias.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicant_id'] = applicantId;
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
