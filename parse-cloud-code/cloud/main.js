Parse.Cloud.job('sendRecurringNotificationToMorning', function(request, response) {
                Parse.Push.send({
                                channels: ['Morning'],
                                data: {
                                alert: 'Hello morning crowd how are you feeling today?'
                                }
                                }, {
                                success: function() {
                                response.success('scheduled order reminder notification')
                                },
                                error: function(error) {
                                response.error('unable to schedule order reminder notification with error ' + error)
                                }
                                })
                })

Parse.Cloud.job('sendRecurringNotificationToAfternoon', function(request, response) {
                Parse.Push.send({
                                channels: ['Afternoon'],
                                data: {
                                alert: 'Hello afternoon crowd how are you feeling today?'
                                }
                                }, {
                                success: function() {
                                response.success('scheduled order reminder notification')
                                },
                                error: function(error) {
                                response.error('unable to schedule order reminder notification with error ' + error)
                                }
                                })
                })

Parse.Cloud.job('sendRecurringNotificationToEvening', function(request, response) {
                Parse.Push.send({
                                channels: ['Evening'],
                                data: {
                                alert: 'Hello evening crowd how are you feeling today?'
                                }
                                }, {
                                success: function() {
                                response.success('scheduled order reminder notification')
                                },
                                error: function(error) {
                                response.error('unable to schedule order reminder notification with error ' + error)
                                }
                                })
                })