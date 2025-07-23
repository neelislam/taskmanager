class Urls{
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static const String registrationUrl = '$_baseUrl/Registration';
  static const String loginUrl = '$_baseUrl/Login';
  static const String createNewTaskUrl = '$_baseUrl/createNewTask';
  static const String getNewTaskUrl = '$_baseUrl/ListTaskByStatus/New';
  static const String getProgressTaskUrl = '$_baseUrl/ListTaskByStatus/Progress';
  static const String getTaskStatusCountUrl = '$_baseUrl/taskStatusCount';


}