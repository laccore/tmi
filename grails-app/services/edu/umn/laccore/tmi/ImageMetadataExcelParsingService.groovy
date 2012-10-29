package edu.umn.laccore.tmi

import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.poifs.filesystem.POIFSFileSystem

class ImageMetadataExcelParsingService {

    static transactional = true

    def serviceMethod() {
		
		def file = request.getFile('file')
		
			   def fs = new POIFSFileSystem
					 (file.getInputStream())
		
			   def wb = new HSSFWorkbook(fs)
		
			   def sheet = wb.getSheetAt(0)
	
			   // Process the data from the sheet and save it in Grails domain objects

    }
}

/*
 * import org.grails.plugins.excelimport.ExcelImportUtils
import org.grails.plugins.excelimport.*
import sample.*

class BookExcelImporter extends AbstractExcelImporter {

static Map CONFIG_BOOK_CELL_MAP = [ sheet:'Sheet2', cellMap: [ 'D3':'title', 'D4':'author', 'D6':'numSold', ] ]

static Map CONFIG_BOOK_COLUMN_MAP = [ sheet:'Sheet1', startRow: 2, columnMap: [ 'B':'title', 'C':'author', 'D':'numSold', ] ]

public BookExcelImporter(fileName) { super(fileName) }

List<Map> getBooks() { List bookList = ExcelImportUtils.columns(workbook, CONFIG_BOOK_COLUMN_MAP) }	//workbook is an interface, HSSFWorkbook implements

Map getOneMoreBookParams() { Map bookParams = ExcelImportUtils.cells(workbook, CONFIG_BOOK_CELL_MAP ) }

}
*/
