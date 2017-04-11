tmi
===

Tool for Microscopic Identification

New environment/refreshed current env steps:
- if refreshsing, delete ~/.grails/<grails version>, ~/.ivy2
- open application.properties, comment out image-tools, umn-web-template plugin lines
- comment out ImageTool imports, references in UtilsService (should be 2, one import, one reference)
- right-click project, choose properties, grails, confirm v2.1.0, click OK. Do it again, should install a few more plugins, not sure why but this is an issue across grails projects, at least for me (rmcewan)
- install umn-web-template and image-tools plugins
- dependency resolution may complain about missing commons-collections-3.1, if so, make sure build.groovy has commons-collection:commons-collections:3.1 as a build dependency
- refresh dependencies
- look at markers window - rename the FlashHelperTagLib private getMsgs method to avoid the markers error, if necessary.
- re-enable the ImageTool import and reference in UtilsService

11.Apr.2017 migrated Git repo to github.umn.edu usuing https://gist.github.com/niksumeiko/8972566 as a guide
    to switch local get repo to new remote follow from Step 2 on using  "git remote add new-origin git@github.umn.edu:laccore-apps/tmi.git" to hook into the migrated repo and deprecate the old remote origin at github.com