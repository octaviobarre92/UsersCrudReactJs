package com.org.sura;

import javax.jms.*;

import com.rabbitmq.client.Connection;
import com.rabbitmq.client.Channel;


import java.nio.charset.StandardCharsets;

public class MyListener implements MessageListener {


    /**
     * @param m
     */
    public void onMessage(Message m) {
        try {
            TextMessage msg = (TextMessage) m;
            pushMessageRabbit(msg.getText());
            System.out.println("following message is received:" + msg.getText());
        } catch (JMSException e) {
            System.out.println(e);
        }
    }


    /**
     * @param mensaje
     */
    public void pushMessageRabbit(String mensaje) {

        try {
            GetValuesConfigFile properties = new GetValuesConfigFile();
            String QUEUE_NAME_RABBIT = properties.getPropValues("queueNameMqRabbitPush.queue");
            com.rabbitmq.client.ConnectionFactory factory = new com.rabbitmq.client.ConnectionFactory();
            factory.setHost(properties.getPropValues("mqHost.connection"));
            Integer port = Integer.valueOf(properties.getPropValues("mqPort.connection"));
            factory.setPort(port);
            factory.setUsername(properties.getPropValues("mqUsername.connection"));
            factory.setPassword(properties.getPropValues("mqPassword.connection"));
            factory.setVirtualHost(properties.getPropValues("mqVirtualHost.connection"));

            Connection connection = factory.newConnection();
            Channel channel = connection.createChannel();
            channel.basicPublish("", QUEUE_NAME_RABBIT, null, mensaje.getBytes(StandardCharsets.UTF_8));
            System.out.println(" [x] Sent '" + mensaje + "'");
            connection.close();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }

    }
}
