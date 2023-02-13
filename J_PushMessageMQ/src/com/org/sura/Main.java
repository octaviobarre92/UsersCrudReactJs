package com.org.sura;

public class Main {
    /**
     * @param args
     */
    public static void main(String[] args) {
        PushMessage pushMessage = new PushMessage();
        pushMessage.SendMessageMQ();
    }
}
