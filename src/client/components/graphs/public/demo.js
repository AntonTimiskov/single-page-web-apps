var jQuery  = require("jqueryify");
var exports = this;
jQuery(function(){
    jQuery.mockjax({
        url: '/mailboxes',
        responseText: [
            {"status": "New", "value": 10, "id": 0},
            {"status": "In progress", "value": 30, "id": 1},
            {"status": "Failed", "value": 40, "id": 2},
            {"status": "Complete", "value": 20, "id": 3}
        ]
    })
    var Graph = require("graph"),
        Model = require("model/job")

    var graph = new Graph({el: $("#main"), Model: Model });
});
