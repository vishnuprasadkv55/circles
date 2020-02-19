class User {
  var token;
  var userDetails;
  User(this.token, this.userDetails) {
    printDetails();
  }
  printDetails() {
    print(token);
    print(userDetails);
  }
  toJson() {
    return {
      'token': token,
      'userDetails': userDetails
    };
  }
  User.fromJson(e){
    token = e.token;
    userDetails = e.userDetails;
    printDetails();
  }
}