package com.org.sura;

import java.io.IOException;

import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.QueueingConsumer;

import java.util.Hashtable;

import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;

import javax.naming.Context;
import javax.naming.InitialContext;

public class GetMessageMQ {

    /**
     * @throws IOException
     */
    public void ReadMessageMQ() throws IOException {
        try {
            GetValuesConfigFile properties = new GetValuesConfigFile();
            ConnectionFactory factory = new ConnectionFactory();
            String QUEUE_NAME_RABBIT = properties.getPropValues("queueNameMqRabbit.queue");
            factory.setHost(properties.getPropValues("mqHost.connection"));
            factory.setUsername(properties.getPropValues("mqUsername.connection"));
            factory.setPassword(properties.getPropValues("mqPassword.connection"));
            Integer port = Integer.valueOf(properties.getPropValues("mqPort.connection"));
            factory.setPort(port);
            factory.setVirtualHost(properties.getPropValues("mqVirtualHost.connection"));

            Connection connection = factory.newConnection();
            Channel channel = connection.createChannel();

            System.out.println(" [*] Waiting for messages. To exit press CTRL+C");
            QueueingConsumer consumer = new QueueingConsumer(channel);
            channel.basicConsume(QUEUE_NAME_RABBIT, true, consumer);

            int index = 0;
            while (true) {

                QueueingConsumer.Delivery message = consumer.nextDelivery();
                String msg = new String(message.getBody());
                System.out.println("processing message: " + msg);
                sendMessageJMS(msg);
                String newMsg = "response";
                byte[] bmsg = newMsg.getBytes();
                Thread.sleep(5000);
                channel.basicPublish("", "trade.response.q", null, bmsg);
                index++;
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }


    /**
     * @param mensaje
     */
    @SuppressWarnings("unchecked")
    public static void sendMessageJMS(String mensaje) {
        try { 
            //Create and start connection
            GetValuesConfigFile properties = new GetValuesConfigFile();
            Hashtable env = new Hashtable(5);
            env.put(Context.INITIAL_CONTEXT_FACTORY, properties.getPropValues("jmsContext.connection"));
            env.put(Context.PROVIDER_URL, properties.getPropValues("jmsHost.connection"));
            Context ctx = new InitialContext(env);
            QueueConnectionFactory f =
                (QueueConnectionFactory) ctx.lookup(properties.getPropValues("jmsJNDIFactory.connection"));
            QueueConnection con = f.createQueueConnection();
            con.start();
            //2) create queue session
            QueueSession ses = con.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
            //3) get the Queue object
            Queue t = (Queue) ctx.lookup(properties.getPropValues("queueJNDIJMS.queue"));
            //4)create QueueSender object
            QueueSender sender = ses.createSender(t);
            //5) create TextMessage object
            TextMessage msg = ses.createTextMessage();
            msg.setText(mensaje);
            sender.send(msg);
            System.out.println("Message successfully sent.");
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
