package com.sura;

import java.io.FileNotFoundException;

import java.io.IOException;
import java.io.InputStream;

import java.util.Properties;

public class ConfigPDF {
    String result = "";
        public String getPropValues(String Key) throws IOException {

            try {

                InputStream stream = ConfigPDF.class.getClassLoader().getResourceAsStream("configPDF.properties");
                Properties prop = new Properties();
                String value = null;
                if (stream != null) {
                    prop.load(stream);
                    value = prop.getProperty(Key);
                } else {
                    throw new FileNotFoundException("property file '" + "configPDF.properties" +
                                                    "' not found in the classpath");
                }

                result = value;
                //System.out.println(result);
            } catch (Exception e) {
                System.out.println("Exception: " + e.getMessage());
            }


            return result;
        }
}

