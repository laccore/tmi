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