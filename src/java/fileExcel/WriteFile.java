/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fileExcel;

import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author 84348
 */
public class WriteFile {

    public void exportExcel() throws IOException {
        try{
            FileOutputStream file = new FileOutputStream("hjhj.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("name");
        XSSFRow row;
        XSSFCell cellA;
        XSSFCell cellB;
        Cell cell=null;
        row = sheet.createRow(0);
        cell=row.createCell(0, CellType.STRING);
        cell.setCellValue("ao that day");
        cell=row.createCell(1, CellType.STRING);
        cell.setCellValue("ao that day");
        
        for (int i = 1; i < 10; i++) {  
            row = sheet.createRow((short)i);
            cellA = row.createCell((short)0);
            cellA.setCellValue((i+1));
            cellB = row.createCell((short)1);
            cellB.setCellValue((i+2));
        }
        
        workbook.write(file);
        workbook.close();
        file.close();
        }catch(Exception e){
            e.printStackTrace();
                    
        }

    }
}
