import java.io.*; 
import java.net.*; 
 
public class AsExam12_29_SocketServer 
{
	public static void main(String[] args) 
    { 
		// ���� �⺻ ��Ʈ
        int port = 8000; 
        // ��Ʈ�� ������ ���ڷ� �Է��� ���
        if(args.length>0)
        {
        	try 
        	{ 
        		port = Integer.parseInt(args[0]); 
        	} 
        	catch (Exception e) 
        	{ 
        		System.out.println("������: java AsExam12_29_SocketServer 8000"); 
        	} 
        }
        // ���� ���� ����
        AsExam12_29_SocketServer server = new AsExam12_29_SocketServer();
        // ���� ���� ����
        server.startService(port);
    } 
	// ������ ��Ʈ�� ���� ���񽺸� �����Ѵ�. ���� ������ 1���� ����Ѵ�.
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
            // ���� ������ 1���� ���
            incoming = socket.accept();
            // Ŭ���̾�Ʈ ���� �޽��� �Է�
            readerIn = new BufferedReader(new InputStreamReader(incoming.getInputStream(), "UTF-8"));
            // ���� ���� �޽��� ���
            pw = new PrintWriter(new OutputStreamWriter(incoming.getOutputStream(), "UTF-8"));
            // ���� ���� 
            char EOF = (char)0x00;
            while((str=readerIn.readLine())!=null)
            {
            	System.out.println("client:" + str);
            	pw.write(str + EOF);
        		pw.flush();
            }            
            System.out.println("Ŭ���̾�Ʈ���� ���� ���� ����");
            incoming.close();
        } 
        catch (Exception e) 
        { 
        	System.out.println(e); 
        } 
	    finally // ���� ���� ó�� 
	    {
	        if ( incoming != null ) try{incoming.close();}catch(Exception e){}
	        if ( readerIn != null ) try{readerIn.close();}catch(Exception e){}
	        if ( pw != null ) try{pw.close();}catch(Exception e){}
	        if ( socket != null ) try{socket.close();}catch(Exception e){}        
	    } 
    }
}
