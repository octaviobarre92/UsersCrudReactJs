package com.sura;

import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;

import java.util.Base64;


public class EncoderDocument {

    public static String encode(final String documento) {

        // Get bytes from string
        byte[] byteArray = Base64.getEncoder().encode(documento.getBytes());
        // Print the encoded string
        String encodedString = new String(byteArray);
        System.out.println(documento + " = " + encodedString);
        return encodedString;
    }

    public static String decode(final String b64Document) {
        // Get bytes from string
        byte[] byteArray = Base64.getDecoder().decode(b64Document.getBytes());
        // Print the decoded string
        String decodedString = new String(byteArray);
        System.out.println(b64Document + " = " + decodedString);
        return decodedString;
    }
    
    public static byte[]  hashStringSHA1(final String cadena) {
        MessageDigest crypt = null;
           try
           {
               crypt = MessageDigest.getInstance("SHA-1");
           }
           catch(NoSuchAlgorithmException e)
           {
               e.printStackTrace();
           }
        return crypt.digest(cadena.getBytes());               
    }
    
    public static String encodeBytes(byte[] input) throws Exception {

                    // Get bytes from string
                    byte[] byteArray = Base64.getEncoder().encode(input);
                    // Print the encoded string
                    return new String(byteArray);
            }       
}
