module.exports = (id)->
    $ = require('jqueryify')
    Graph = require('graph')
    Model = require('model/job')
    Panel = require('panel')

    panel = new Panel({
        el: $("##{id}"),
        title: 'mailboxes'
    })

    graph = new Graph({
        el: panel.body(),
        Model: Model
    })

    panel.add graph

    panel.refresh()


