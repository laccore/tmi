package edu.umn.laccore.tmi

class ReindexJob {
	def adminService
	static triggers = {
      cron name: 'reindexTrigger', cronExpression: "0 0/15 * * * ?"
    }

    def execute() {
		log.info "reindexing tags"
		adminService.deleteTags()
		adminService.recreateTags()
		log.info "reindexing tags complete"
		log.info "reindexing search"
		adminService.reindexSearch()
		log.info "reindexing search complete"
    }
}