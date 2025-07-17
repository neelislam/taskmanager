class User{
     late String id;
     late String email;
     late String firstName;
     late String lastName;
     late String mobile;



     User.fromJson(Map<String, dynamic>jsonData){
       id = jsonData['_id'];
       email = jsonData['_email'];
       firstName = jsonData['firstname'];
       lastName = jsonData['lastName'];
       mobile =  jsonData['mobile'];

     }
}