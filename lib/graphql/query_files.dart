

class GraphQLQuery {
  static String getAPIData() {
    return '''
       query ReadFileFromS3(\$data:File_update_time_input){
       readFileFromS3(data:\$data)
      }
    ''';
  }

  static String submitFeedback( ) {
     return '''
          mutation Mutation(\$record: [JSON]!,\$userId:String) {
          createFeedbackRecord(record: \$record,user_id:\$userId)
           }
      ''';
  }
}
