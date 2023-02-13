package com.sura;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;

import java.util.Base64;

public class PdfWriter {
    
    /*
    public static void main(String args []){
        
        WriteFileOnbase("E8-146-543|rsotillo@soaint.com|107|32","TMP442");   
        
        }
  */
    /**
     * @param documento
     * @param docName
     * @return
     */
    public static String WritePDF(final String documento,final  String docName) {
        ConfigPDF conf = new ConfigPDF();
        String path = null;
        String exitPath = null;
        try {
            
            String PATH_FOLDER = conf.getPropValues("pathfolderInsis.path");
            String STATIC_PATH = conf.getPropValues("staticInsis.path");
            
            String fullPath = PATH_FOLDER + docName;
            String staticPath = STATIC_PATH + docName;
            
            path = fullPath;
            exitPath = staticPath;
                     
            File file = new File(fullPath);
            
            try (FileOutputStream fos = new FileOutputStream(file)) {
                // To be short I use a corrupted PDF string, so make sure to use a valid one if you want to preview the PDF file
                String b64 = documento;
                byte[] decoder = Base64.getDecoder().decode(b64);
            
                fos.write(decoder);
                System.out.println("PDF File Saved");
            } catch (Exception e) {
                
                e.printStackTrace();
            }
        } catch (IOException e1) {
            System.out.println(e1);
        }
        return exitPath;
    }

    /**
     * @param content
     * @param idTemporal
     */
    public static void WriteFileOnbase(final String content, String idTemporal) {
        ConfigPDF conf = new ConfigPDF();
        String path = null;
        try {
            
            String PATH_FOLDER = conf.getPropValues("pathfolderOnbase.path");
            
            String fullPath = PATH_FOLDER + idTemporal + ".txt";
            path = fullPath;

            try {
                FileWriter myWriter = new FileWriter(fullPath);
                myWriter.write(content);
                myWriter.close();
                System.out.println("Successfully wrote to the file.");
            } catch (Exception e) {
                
                e.printStackTrace();
            }
        } catch (IOException e1) {
            System.out.println(e1);
        }
    }
}
