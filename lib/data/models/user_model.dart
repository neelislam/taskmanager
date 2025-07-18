class UserModel{
     late String id;
     late String email;
     late String firstName;
     late String lastName;
     late String mobile;

String get fullName{
 return '$firstName $lastName';
}


     // Json to dart format conversion
     UserModel.fromJson(Map<String, dynamic>jsonData){
       id = jsonData['_id'];
       email = jsonData['_email'];
       firstName = jsonData['firstname'];
       lastName = jsonData['lastName'];
       mobile =  jsonData['mobile'];

     }


     //dart to Json format conversion
     Map<String, dynamic> toJson(){
       return{
         'id': id,
         'email' : email,
         'firstName' : firstName,
         'lastName' : lastName,
         'mobile' : mobile
       };
     }
}