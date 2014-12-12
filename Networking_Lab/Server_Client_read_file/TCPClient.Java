/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
package tcpclient;
import java.io.*; 
import java.net.*; 
 
/**
 *
 * @author User
 */
public class TCPClient {
 
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
 
        String sentence; 
        String modifiedSentence; 
 
        BufferedReader inFromUser =  new BufferedReader(new InputStreamReader(System.in)); 
 
        Socket clientSocket = new Socket("localhost", 6789); 
 
        DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream()); 
        BufferedReader inFromServer =  new BufferedReader(new InputStreamReader(clientSocket.getInputStream())); 
        System.out.println("Enter page Request");
        sentence = inFromUser.readLine(); 
 
        outToServer.writeBytes(sentence + '\n'); 
 
        modifiedSentence = inFromServer.readLine(); 
 
        System.out.println("FROM SERVER: " + modifiedSentence); 
        if ( modifiedSentence != "404 not found" )
                { modifiedSentence = inFromServer.readLine(); 
 
                   System.out.println("FROM SERVER: " + modifiedSentence); 
 
            }
        clientSocket.close(); 
 
 
    } 
 
 
    }
 
