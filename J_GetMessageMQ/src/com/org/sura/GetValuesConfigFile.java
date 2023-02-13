package com.org.sura;

import java.io.FileNotFoundException;

import java.io.IOException;
import java.io.InputStream;

import java.util.Properties;

public class GetValuesConfigFile {
    String result = "";

    public String getPropValues(String Key) throws IOException {

        try {

            InputStream stream = GetValuesConfigFile.class.getClassLoader().getResourceAsStream("config.properties");
            Properties prop = new Properties();
            String value = null;
            if (stream != null) {
                prop.load(stream);
                value = prop.getProperty(Key);
            } else {
                throw new FileNotFoundException("property file '" + "config.properties" +
                                                "' not found in the classpath");
            }

            result = value;
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }


        return result;
    }
}
