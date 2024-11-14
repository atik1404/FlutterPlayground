class Category {
  final String categoryName;
  final String categoryId;
  var isSelected = false;

  Category(this.categoryId, this.categoryName, this.isSelected);
}

List<Category> getCategoryList() {
  final categories = [
    Category('1', 'Actions', true),
    Category('2', 'Adventure', false),
    Category('3', 'Animation', false),
    Category('4', 'Crime', false),
    Category('5', 'Thriller', false),
    Category('6', 'Comedy', false),
    Category('7', 'Horror', false),
    Category('8', 'Si-Fi', false),
    Category('9', 'Drama', false),
  ];

  return categories;
}
