package com.org.sura;


import java.util.Hashtable;

import javax.jms.*;

import javax.naming.Context;
import javax.naming.InitialContext;

@SuppressWarnings("unchecked")
public class PushMessage {
    public void SendMessageMQ() {
        try {
            GetValuesConfigFile properties = new GetValuesConfigFile();
            //1) Create and start connection
            Hashtable env = new Hashtable(5);
            env.put(Context.INITIAL_CONTEXT_FACTORY, properties.getPropValues("jmsContext.connection"));
            env.put(Context.PROVIDER_URL, properties.getPropValues("jmsHost.connection"));
            Context ctx = new InitialContext(env);
            //InitialContext ctx=new InitialContext();
            QueueConnectionFactory f =
                (QueueConnectionFactory) ctx.lookup(properties.getPropValues("jmsJNDIFactory.connection"));
            QueueConnection con = f.createQueueConnection();
            con.start();
            //2) create Queue session
            QueueSession ses = con.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
            //3) get the Queue object
            Queue t = (Queue) ctx.lookup(properties.getPropValues("queueJNDIJMSPush.queue"));
            //4)create QueueReceiver
            QueueReceiver receiver = ses.createReceiver(t);

            //5) create listener object
            MyListener listener = new MyListener();

            //6) register the listener object with receiver
            receiver.setMessageListener(listener);
            System.out.println("liste " + receiver.getMessageListener().toString());
            System.out.println("Receiver is ready, waiting for messages...");
            System.out.println("press Ctrl+c to shutdown...");
            while (true) {
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
