import java.io.*; 
import java.net.*; 
import java.util.ArrayList;

public class AsExam12_30_SocketServer 
{
	// 클라이언트 쓰레드(MultiChatThread)들을 담는 ArrayList
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
        		System.out.println("사용법예: java AsExam12_30_SocketServer 8000"); 
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
        		System.out.println(ip + "의 클라이언트가 접속했습니다.");                
        		// 클라이언트가 접속하면 쓰레드를 생성하여 실행한다.
        		mct = new MultiChatThread(clientSocket);
        		// 쓰레드 시작
                mct.start(); 
                // 클라이언트 쓰레드를 ArrayList에 추가
                chatList.add(mct);
        	}
        	System.out.println("채팅 서버가 종료되었습니다.");
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
    // 클라이언트 소켓을 쓰레드로 실행한다.
    class MultiChatThread extends Thread 
    {
    	private Socket clientSocket = null;
        private PrintStream printOut = null;
        private BufferedReader readerIn = null;    	
        
        public MultiChatThread(Socket sock)
        {
        	this.clientSocket = sock;
        }
        // 클라이언트가 접속을 끊을 때 까지 계속 실행된다.
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
    				// 소켓 연결시 서버 환영 메시지를 출력함
    				printOut.println("[Server]Welcome");
    				// 클라이언트 소켓입력이 들어오면
    				while((str=readerIn.readLine())!=null)
    				{
    					System.out.println("[Client]:"+ str);
    					broadCasting(str); 
    				}      	
    				isRunning = false;  //  종료
    	            System.out.println("클라이언트에서 소켓 연결 종료");
    	            clientSocket.close();     		
    	            // 쓰레드를 리스트에서 제거한다.
    			    chatList.remove(this);
    			}
    		}
    		catch(Exception e)
    		{
    			System.out.println("채팅쓰레드에러" + e);
    		}
    	    finally 
    	    {
    	    	chatList.remove(this);
    	        if ( clientSocket != null ) try{clientSocket.close();}catch(Exception e){}
    	        if ( readerIn != null ) try{readerIn.close();}catch(Exception e){}
    	        if ( printOut != null ) try{printOut.close();}catch(Exception e){}
    	    }     		
    	}
    	// 클라이언트 메시지를 전송한다.
	    public void broadCasting(String message) 
	    {
	        for (MultiChatThread ct:chatList) 
	        {
	          ct.send(message);
	        }
	    } 
	    // 소켓으로 메시지를 출력하면 소켓에 연결된 모든 클라이언트들이 메시지를 수신한다.
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
