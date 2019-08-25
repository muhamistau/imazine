// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
    int id;
    DateTime date;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    String type;
    String link;
    Guid title;
    Content content;
    Content excerpt;
    int author;
    int featuredMedia;
    String commentStatus;
    String pingStatus;
    bool sticky;
    String template;
    String format;
    List<dynamic> meta;
    List<int> categories;
    List<int> tags;
    Links links;

    Post({
        this.id,
        this.date,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.categories,
        this.tags,
        this.links,
    });

    factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Post.fromJson(Map<String, dynamic> json) => new Post(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: new List<dynamic>.from(json["meta"].map((x) => x)),
        categories: new List<int>.from(json["categories"].map((x) => x)),
        tags: new List<int>.from(json["tags"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": new List<dynamic>.from(meta.map((x) => x)),
        "categories": new List<dynamic>.from(categories.map((x) => x)),
        "tags": new List<dynamic>.from(tags.map((x) => x)),
        "_links": links.toJson(),
    };
}

class Content {
    String rendered;
    bool protected;

    Content({
        this.rendered,
        this.protected,
    });

    factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Content.fromJson(Map<String, dynamic> json) => new Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

class Guid {
    String rendered;

    Guid({
        this.rendered,
    });

    factory Guid.fromRawJson(String str) => Guid.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Guid.fromJson(Map<String, dynamic> json) => new Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<About> versionHistory;
    List<About> wpAttachment;
    List<WpTerm> wpTerm;
    List<Cury> curies;

    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.wpAttachment,
        this.wpTerm,
        this.curies,
    });

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => new Links(
        self: new List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: new List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: new List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: new List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: new List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: new List<About>.from(json["version-history"].map((x) => About.fromJson(x))),
        wpAttachment: new List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: new List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: new List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": new List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": new List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": new List<dynamic>.from(about.map((x) => x.toJson())),
        "author": new List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": new List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": new List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:attachment": new List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": new List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": new List<dynamic>.from(curies.map((x) => x.toJson())),
    };
}

class About {
    String href;

    About({
        this.href,
    });

    factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory About.fromJson(Map<String, dynamic> json) => new About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    bool embeddable;
    String href;

    Author({
        this.embeddable,
        this.href,
    });

    factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Author.fromJson(Map<String, dynamic> json) => new Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class Cury {
    String name;
    String href;
    bool templated;

    Cury({
        this.name,
        this.href,
        this.templated,
    });

    factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cury.fromJson(Map<String, dynamic> json) => new Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
    };
}

class WpTerm {
    String taxonomy;
    bool embeddable;
    String href;

    WpTerm({
        this.taxonomy,
        this.embeddable,
        this.href,
    });

    factory WpTerm.fromRawJson(String str) => WpTerm.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WpTerm.fromJson(Map<String, dynamic> json) => new WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
    };
}
