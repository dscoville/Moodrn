
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

var tomorrowDate = new Date();

var query = new Parse.Query(Parse.Installation);
query.equalTo('channels', 'Morning');

Parse.Push.send({
                where: query,
                data: {
                alert: "How are you feeling morning crowd?"
                },
                push_time: tomorrowDate
                }, {
                success: function() {
                // Push was successful
                },
                error: function(error) {
                // Handle error
                }
                });