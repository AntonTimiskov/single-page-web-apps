module.exports.total = (jobs)->
        total = 0
        for job in jobs
            total += job.value
        total

module.exports.percent = (jobs, value)->
    parseInt(value * 100 / module.exports.total(jobs))

