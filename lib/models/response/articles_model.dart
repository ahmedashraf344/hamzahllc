class ArticlesModel {
  ArticlesModel({
    this.abstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.source,
    this.multimedia,
    this.headline,
    this.keywords,
    this.pubDate,
    this.documentType,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.byline,
    this.typeOfMaterial,
    this.id,
    this.wordCount,
    this.uri,
  });

  ArticlesModel.fromJson(dynamic json) {
    abstract = json['abstract'];
    webUrl = json['web_url'];
    snippet = json['snippet'];
    leadParagraph = json['lead_paragraph'];
    source = json['source'];
    if (json['multimedia'] != null) {
      multimedia = [];
      json['multimedia'].forEach((v) {
        multimedia?.add(Multimedia.fromJson(v));
      });
    }
    headline =
        json['headline'] != null ? Headline.fromJson(json['headline']) : null;
    if (json['keywords'] != null) {
      keywords = [];
      json['keywords'].forEach((v) {
        keywords?.add(Keywords.fromJson(v));
      });
    }
    pubDate = json['pub_date'];
    documentType = json['document_type'];
    newsDesk = json['news_desk'];
    sectionName = json['section_name'];
    subsectionName = json['subsection_name'];
    byline = json['byline'] != null ? Byline.fromJson(json['byline']) : null;
    typeOfMaterial = json['type_of_material'];
    id = json['_id'];
    wordCount = json['word_count'];
    uri = json['uri'];
  }
  String? abstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keywords>? keywords;
  String? pubDate;
  String? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  String? typeOfMaterial;
  String? id;
  num? wordCount;
  String? uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abstract'] = abstract;
    map['web_url'] = webUrl;
    map['snippet'] = snippet;
    map['lead_paragraph'] = leadParagraph;
    map['source'] = source;
    if (multimedia != null) {
      map['multimedia'] = multimedia?.map((v) => v.toJson()).toList();
    }
    if (headline != null) {
      map['headline'] = headline?.toJson();
    }
    if (keywords != null) {
      map['keywords'] = keywords?.map((v) => v.toJson()).toList();
    }
    map['pub_date'] = pubDate;
    map['document_type'] = documentType;
    map['news_desk'] = newsDesk;
    map['section_name'] = sectionName;
    map['subsection_name'] = subsectionName;
    if (byline != null) {
      map['byline'] = byline?.toJson();
    }
    map['type_of_material'] = typeOfMaterial;
    map['_id'] = id;
    map['word_count'] = wordCount;
    map['uri'] = uri;
    return map;
  }
}

class Byline {
  Byline({
    this.original,
    this.person,
    this.organization,
  });

  Byline.fromJson(dynamic json) {
    original = json['original'];
    if (json['person'] != null) {
      person = [];
      json['person'].forEach((v) {
        person?.add(Person.fromJson(v));
      });
    }
    organization = json['organization'];
  }
  String? original;
  List<Person>? person;
  dynamic organization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['original'] = original;
    if (person != null) {
      map['person'] = person?.map((v) => v.toJson()).toList();
    }
    map['organization'] = organization;
    return map;
  }
}

class Person {
  Person({
    this.firstname,
    this.middlename,
    this.lastname,
    this.qualifier,
    this.title,
    this.role,
    this.organization,
    this.rank,
  });

  Person.fromJson(dynamic json) {
    firstname = json['firstname'];
    middlename = json['middlename'];
    lastname = json['lastname'];
    qualifier = json['qualifier'];
    title = json['title'];
    role = json['role'];
    organization = json['organization'];
    rank = json['rank'];
  }
  String? firstname;
  dynamic middlename;
  String? lastname;
  dynamic qualifier;
  dynamic title;
  String? role;
  String? organization;
  num? rank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = firstname;
    map['middlename'] = middlename;
    map['lastname'] = lastname;
    map['qualifier'] = qualifier;
    map['title'] = title;
    map['role'] = role;
    map['organization'] = organization;
    map['rank'] = rank;
    return map;
  }
}

class Keywords {
  Keywords({
    this.name,
    this.value,
    this.rank,
    this.major,
  });

  Keywords.fromJson(dynamic json) {
    name = json['name'];
    value = json['value'];
    rank = json['rank'];
    major = json['major'];
  }
  String? name;
  String? value;
  num? rank;
  String? major;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    map['rank'] = rank;
    map['major'] = major;
    return map;
  }
}

class Headline {
  Headline({
    this.main,
    this.kicker,
    this.contentKicker,
    this.printHeadline,
    this.name,
    this.seo,
    this.sub,
  });

  Headline.fromJson(dynamic json) {
    main = json['main'];
    kicker = json['kicker'];
    contentKicker = json['content_kicker'];
    printHeadline = json['print_headline'];
    name = json['name'];
    seo = json['seo'];
    sub = json['sub'];
  }
  String? main;
  dynamic kicker;
  dynamic contentKicker;
  dynamic printHeadline;
  dynamic name;
  dynamic seo;
  dynamic sub;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = main;
    map['kicker'] = kicker;
    map['content_kicker'] = contentKicker;
    map['print_headline'] = printHeadline;
    map['name'] = name;
    map['seo'] = seo;
    map['sub'] = sub;
    return map;
  }
}

class Multimedia {
  Multimedia({
    this.rank,
    this.subtype,
    this.caption,
    this.credit,
    this.type,
    this.url,
    this.height,
    this.width,
    this.legacy,
    this.subType,
    this.cropName,
  });

  Multimedia.fromJson(dynamic json) {
    rank = json['rank'];
    subtype = json['subtype'];
    caption = json['caption'];
    credit = json['credit'];
    type = json['type'];
    url = json['url'];
    height = json['height'];
    width = json['width'];
    legacy = json['legacy'] != null ? Legacy.fromJson(json['legacy']) : null;
    subType = json['subType'];
    cropName = json['crop_name'];
  }
  num? rank;
  String? subtype;
  dynamic caption;
  dynamic credit;
  String? type;
  String? url;
  num? height;
  num? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = rank;
    map['subtype'] = subtype;
    map['caption'] = caption;
    map['credit'] = credit;
    map['type'] = type;
    map['url'] = url;
    map['height'] = height;
    map['width'] = width;
    if (legacy != null) {
      map['legacy'] = legacy?.toJson();
    }
    map['subType'] = subType;
    map['crop_name'] = cropName;
    return map;
  }
}

class Legacy {
  Legacy({
    this.xlarge,
    this.xlargewidth,
    this.xlargeheight,
  });

  Legacy.fromJson(dynamic json) {
    xlarge = json['xlarge'];
    xlargewidth = json['xlargewidth'];
    xlargeheight = json['xlargeheight'];
  }
  String? xlarge;
  num? xlargewidth;
  num? xlargeheight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['xlarge'] = xlarge;
    map['xlargewidth'] = xlargewidth;
    map['xlargeheight'] = xlargeheight;
    return map;
  }
}
