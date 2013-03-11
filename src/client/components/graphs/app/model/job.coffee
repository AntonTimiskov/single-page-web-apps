Spine = require('spine')

class Job extends Spine.Model
    @configure "status", "value"
    @extend Spine.Model.Ajax
    @url: "/mailboxes"

module.exports = Job
