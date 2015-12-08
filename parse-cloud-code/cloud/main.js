Parse.Cloud.job('sendRecurringNotificationToMorning', function(request, response) {
                Parse.Push.send({
                                channels: ['Morning'],
                                data: {
                                alert: 'Hey there! How are you feeling today?',
                                view: 'ComposerViewController',
                                category: 'HOWAREYOUFEELING'
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
                                alert: 'Hey there! How are you feeling today?',
                                view: 'ComposerViewController',
                                category: 'HOWAREYOUFEELING'
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
                                alert: 'Hey there! How are you feeling today?',
                                view: 'ComposerViewController',
                                category: 'HOWAREYOUFEELING'
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