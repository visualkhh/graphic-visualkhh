import java.io.*; 
import java.net.*; 
import java.util.ArrayList;

public class AsExam12_30_SocketServer 
{
	// Ŭ���̾�Ʈ ������(MultiChatThread)���� ��� ArrayList
	private ArrayList<MultiChatThread> chatList;
	public static void main(String[] args)
	{
        int port = 8000; 
        if(args.length>0)
        {
        	try 
        	{ 
        		port = Integer.parseInt(args[0]); 
        	} 
        	catch (Exception e) 
        	{ 
        		System.out.println("������: java AsExam12_30_SocketServer 8000"); 
        	} 
        }		
        AsExam12_30_SocketServer server = new AsExam12_30_SocketServer();
        server.startService(port);        
	}

    private void startService(int port) 
    { 
    	System.out.println("# Starting AsExam12_30_SocketServer"); 
    	chatList = new ArrayList<MultiChatThread>();
        Socket clientSocket = null;
        ServerSocket serverSocket = null;
        try 
        { 
        	serverSocket = new ServerSocket(port); 
        	MultiChatThread mct = null;
        	boolean isRunning = true;
        	while(isRunning) 
        	{
        		clientSocket = serverSocket.accept(); 
        		InetAddress addr = serverSocket.getInetAddress();    
        		String ip = addr.getHostAddress();
        		System.out.println(ip + "�� Ŭ���̾�Ʈ�� �����߽��ϴ�.");                
        		// Ŭ���̾�Ʈ�� �����ϸ� �����带 �����Ͽ� �����Ѵ�.
        		mct = new MultiChatThread(clientSocket);
        		// ������ ����
                mct.start(); 
                // Ŭ���̾�Ʈ �����带 ArrayList�� �߰�
                chatList.add(mct);
        	}
        	System.out.println("ä�� ������ ����Ǿ����ϴ�.");
        } 
        catch (Exception e) 
        { 
            System.out.println(e); 
        } 
	    finally 
	    {
	        if ( clientSocket != null ) try{clientSocket.close();}catch(Exception e){}
	        if ( serverSocket != null ) try{serverSocket.close();}catch(Exception e){}        
	    }     	
    }
    // Ŭ���̾�Ʈ ������ ������� �����Ѵ�.
    class MultiChatThread extends Thread 
    {
    	private Socket clientSocket = null;
        private PrintStream printOut = null;
        private BufferedReader readerIn = null;    	
        
        public MultiChatThread(Socket sock)
        {
        	this.clientSocket = sock;
        }
        // Ŭ���̾�Ʈ�� ������ ���� �� ���� ��� ����ȴ�.
    	public void run()
    	{
    		boolean isRunning = true;
    		String str = null;
    		try
    		{
    			while(isRunning) 
    			{
    				readerIn = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
    				printOut = new PrintStream(clientSocket.getOutputStream()); 
    				// ���� ����� ���� ȯ�� �޽����� �����
    				printOut.println("[Server]Welcome");
    				// Ŭ���̾�Ʈ �����Է��� ������
    				while((str=readerIn.readLine())!=null)
    				{
    					System.out.println("[Client]:"+ str);
    					broadCasting(str); 
    				}      	
    				isRunning = false;  //  ����
    	            System.out.println("Ŭ���̾�Ʈ���� ���� ���� ����");
    	            clientSocket.close();     		
    	            // �����带 ����Ʈ���� �����Ѵ�.
    			    chatList.remove(this);
    			}
    		}
    		catch(Exception e)
    		{
    			System.out.println("ä�þ����忡��" + e);
    		}
    	    finally 
    	    {
    	    	chatList.remove(this);
    	        if ( clientSocket != null ) try{clientSocket.close();}catch(Exception e){}
    	        if ( readerIn != null ) try{readerIn.close();}catch(Exception e){}
    	        if ( printOut != null ) try{printOut.close();}catch(Exception e){}
    	    }     		
    	}
    	// Ŭ���̾�Ʈ �޽����� �����Ѵ�.
	    public void broadCasting(String message) 
	    {
	        for (MultiChatThread ct:chatList) 
	        {
	          ct.send(message);
	        }
	    } 
	    // �������� �޽����� ����ϸ� ���Ͽ� ����� ��� Ŭ���̾�Ʈ���� �޽����� �����Ѵ�.
	    public void send(String message) 
	    {  
	        try 
	        {
	        	printOut.println(message);
	        } 
	        catch (Exception e) 
	        {
	          e.printStackTrace();
	        }
	    }    	
	}
}
