class UserModel{
  String? id; // Made nullable
  String? email; // Corrected key and made nullable
  String? firstName; // Corrected key and made nullable
  String? lastName; // Made nullable
  String? mobile; // Made nullable
  String? createdDate; // Added and made nullable

  String get fullName {
    // Safely access firstName and lastName, providing empty string if null
    return '${firstName ?? ''} ${lastName ?? ''}';
  }

  // Json to dart format conversion
  UserModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['_id'];
    email = jsonData['email']; // Corrected from '_email' to 'email'
    firstName = jsonData['firstName']; // Corrected from 'firstname' to 'firstName'
    lastName = jsonData['lastName'];
    mobile = jsonData['mobile'];
    createdDate = jsonData['createdDate']; // Added parsing for createdDate
  }

  // dart to Json format conversion
  Map<String, dynamic> toJson() {
    return {
      '_id': id, // Using _id to match API response for consistency
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'createdDate': createdDate, // Added to toJson
    };
  }
}