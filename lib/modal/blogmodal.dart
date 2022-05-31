class BlogModal {
  List<BlogListModal> blogs = [];
  BlogModal(js) {
    for (var i = 0; i < js.length; i++) {
      blogs.add(BlogListModal(js[i]));
    }
  }
}

class BlogListModal {
  String? id;
  String? title;
  String? image;
  BlogListModal(js) {
    id = js['id'] ?? "";
    title = js['title'] ?? "";
    image = js['img'] ?? "";
  }
}

class BlogdetailsModal {
  String? image;
  String? title;
  String? desc;
  String? time;
  BlogdetailsModal(js) {
    image = js['img'] ?? "";
    title = js['title'] ?? "";
    desc = js['blog_desc'] ?? "";
    time = js['created_on'] ?? "";
  }
}

class StoryModal {
  List<Storylistmodal> stories = [];
  StoryModal(js) {
    for (var i = 0; i < js.length; i++) {
      stories.add(Storylistmodal(js[i]));
    }
  }
}

class Storylistmodal {
  String? id;
  String? title;
  String? story;
  List<Storyimg> image = [];
  String? date;
  Storylistmodal(js) {
    id = js['id'] ?? "";
    title = js['title'] ?? "";
    story = js['story'] ?? "";
    date = js['created_on'] ?? "";
    for (var i = 0; i < js['img'].length; i++) {
      image.add(Storyimg(js['img'][i]));
    }
  }
}

class Storyimg {
  String? id;
  String? image;

  Storyimg(js) {
    id = js['id'] ?? "";
    image = js['image'] ?? "";
  }
}

class Questionmodal {
  List<Questiondetailmodal> ques = [];
  Questionmodal(js) {
    for (var i = 0; i < js.length; i++) {
      ques.add(Questiondetailmodal(js[i]));
    }
  }
}

class Questiondetailmodal {
  String? question_id;
  String? question;
  dynamic? anser_count;
  String? user_name;
  String? img;
  String? created_on;
  Questiondetailmodal(js) {
    question_id = js['question_id'] ?? "";
    question = js['question'] ?? "";
    anser_count = js['answer_count'] ?? "";
    user_name = js['user_name'] ?? "User name";
    img = js['img'] ?? "";
    created_on = js['created_on'] ?? "";
  }
}
