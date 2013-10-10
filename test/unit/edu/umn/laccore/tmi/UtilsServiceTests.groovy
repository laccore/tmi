package edu.umn.laccore.tmi

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(UtilsService)
class UtilsServiceTests {

    void testSomething() {
        def fname1 = "superfile.png"
		def fname2 = "super.file.png"
		def fname3 = "superfile"
		assert UtilsService.getExtension(fname1) == "png"
		assert UtilsService.stripExtension(fname1) == "superfile"
		assert UtilsService.getExtension(fname2) == "png"
		assert UtilsService.stripExtension(fname2) == "super.file"
		assert UtilsService.getExtension(fname3) == ""
		assert UtilsService.stripExtension(fname3) == "superfile"
    }
}
