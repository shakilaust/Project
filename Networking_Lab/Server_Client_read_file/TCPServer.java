/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
package tcpserver;
import java.io.*; 
import java.net.*; 
 
/**
 *
 * @author User
 */
public class TCPServer {
 
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        String clientSentence = "" ; 
        String sCurrentLine = "" ;
        String sPreceedingLines = "";
 
 
      ServerSocket welcomeSocket = new ServerSocket(6789); 
 
      while(true) { 
 
            Socket connectionSocket = welcomeSocket.accept(); 
 
           BufferedReader inFromClient = 
              new BufferedReader(new
              InputStreamReader(connectionSocket.getInputStream())); 
                      DataOutputStream  outToClient = 
             new DataOutputStream(connectionSocket.getOutputStream()); 
             sCurrentLine="";
             sPreceedingLines="";
           clientSentence = inFromClient.readLine(); 
           System.out.println(" Request from Clint : "+clientSentence );
           String dir = "C:/Users/User/Desktop/Networking/" ;
         //  FileReader File = new FileReader("F:/4.2/Network Programing Lab/Lab Assignmet/Server File"+clientSentence);
             try (BufferedReader br = new BufferedReader(new FileReader(dir+clientSentence)))
		{
 
 
 
 
			while ((sCurrentLine = br.readLine()) != null) {
                                sPreceedingLines=sPreceedingLines+sCurrentLine;
 
			}
 
 
                         outToClient.writeBytes( "200 ok :"+clientSentence+'\n');
                         outToClient.writeBytes("The File "+sPreceedingLines+'\n');
		} catch (IOException e) {
			//e.printStackTrace();
                     //System.out.println("404 not found");
                     outToClient.writeBytes("404 not found"+'\n');
		} 
 
 
        } 
 
 
 
    }
 
}
 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
package tcpserver;
import java.io.*; 
import java.net.*; 
 
/**
 *
 * @author User
 */
public class TCPServer {
 
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        String clientSentence = "" ; 
        String sCurrentLine = "" ;
        String sPreceedingLines = "";
 
 
      ServerSocket welcomeSocket = new ServerSocket(6789); 
 
      while(true) { 
 
            Socket connectionSocket = welcomeSocket.accept(); 
 
           BufferedReader inFromClient = 
              new BufferedReader(new
              InputStreamReader(connectionSocket.getInputStream())); 
                      DataOutputStream  outToClient = 
             new DataOutputStream(connectionSocket.getOutputStream()); 
             sCurrentLine="";
             sPreceedingLines="";
           clientSentence = inFromClient.readLine(); 
           System.out.println(" Request from Clint : "+clientSentence );
           String dir = "C:/Users/User/Desktop/Networking/" ;
         //  FileReader File = new FileReader("F:/4.2/Network Programing Lab/Lab Assignmet/Server File"+clientSentence);
             try (BufferedReader br = new BufferedReader(new FileReader(dir+clientSentence)))
		{
 
 
 
 
			while ((sCurrentLine = br.readLine()) != null) {
                                sPreceedingLines=sPreceedingLines+sCurrentLine;
 
			}
 
 
                         outToClient.writeBytes( "200 ok :"+clientSentence+'\n');
                         outToClient.writeBytes("The File "+sPreceedingLines+'\n');
		} catch (IOException e) {
			//e.printStackTrace();
                     //System.out.println("404 not found");
                     outToClient.writeBytes("404 not found"+'\n');
		} 
 
 
        } 
 
 
 
    }
 
}
 
