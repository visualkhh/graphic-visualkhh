import java.io.*; 
import java.net.*; 
 
public class AsExam12_29_SocketServer 
{
	public static void main(String[] args) 
    { 
		// 소켓 기본 포트
        int port = 8000; 
        // 포트를 별도의 인자로 입력할 경우
        if(args.length>0)
        {
        	try 
        	{ 
        		port = Integer.parseInt(args[0]); 
        	} 
        	catch (Exception e) 
        	{ 
        		System.out.println("사용법예: java AsExam12_29_SocketServer 8000"); 
        	} 
        }
        // 소켓 서버 생성
        AsExam12_29_SocketServer server = new AsExam12_29_SocketServer();
        // 소켓 서비스 시작
        server.startService(port);
    } 
	// 지정된 포트로 소켓 서비스를 시작한다. 소켓 연결은 1개만 허용한다.
    private void startService(int port) 
    { 
        System.out.println("@ Starting AsExam12_29_SocketServer"); 
        ServerSocket socket = null;
        PrintWriter pw = null;
        BufferedReader readerIn = null;
        Socket incoming = null;
        String str = null;
        try 
        { 
            socket = new ServerSocket(port);
            // 소켓 연결은 1개만 허용
            incoming = socket.accept();
            // 클라이언트 소켓 메시지 입력
            readerIn = new BufferedReader(new InputStreamReader(incoming.getInputStream(), "UTF-8"));
            // 서버 소켓 메시지 출력
            pw = new PrintWriter(new OutputStreamWriter(incoming.getOutputStream(), "UTF-8"));
            // 종료 문자 
            char EOF = (char)0x00;
            while((str=readerIn.readLine())!=null)
            {
            	System.out.println("client:" + str);
            	pw.write(str + EOF);
        		pw.flush();
            }            
            System.out.println("클라이언트에서 소켓 연결 종료");
            incoming.close();
        } 
        catch (Exception e) 
        { 
        	System.out.println(e); 
        } 
	    finally // 소켓 종료 처리 
	    {
	        if ( incoming != null ) try{incoming.close();}catch(Exception e){}
	        if ( readerIn != null ) try{readerIn.close();}catch(Exception e){}
	        if ( pw != null ) try{pw.close();}catch(Exception e){}
	        if ( socket != null ) try{socket.close();}catch(Exception e){}        
	    } 
    }
}
