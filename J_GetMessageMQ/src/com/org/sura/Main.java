package com.org.sura;

import java.io.IOException;

public class Main {
    /**
     * @param args
     */
    @SuppressWarnings("oracle.jdeveloper.java.semantic-warning")
    public static void main(String[] args) {
        GetMessageMQ getMessageMq;
        getMessageMq = new GetMessageMQ();
        try {
            getMessageMq.ReadMessageMQ();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}
