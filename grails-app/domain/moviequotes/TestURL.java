package moviequotes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by jpdixon on 4/11/16.
 */
public class TestURL {
    public static void main(String args[]) {
        URL url;
        InputStream is=null;
                BufferedReader br;
        String line;

        try {
            url=new URL("http://169.254.169.254/latest/meta-data/instance-id");
            URLConnection urlCxn=url.openConnection();
            urlCxn.setConnectTimeout(15000);
            urlCxn.setReadTimeout(15000);
            urlCxn.setAllowUserInteraction(false);
            urlCxn.setDoOutput(true);

            is=urlCxn.getInputStream();
            br= new BufferedReader(new InputStreamReader(is));

            while((line=br.readLine()) !=null) {
                System.out.println(line);
            }
        }
        catch(SocketTimeoutException ste) {
            System.out.println("localhost");
        }
        catch (Exception e) {
            e.printStackTrace();
            try {
                if (is != null) is.close();
            }
            catch (IOException ioe) {
            // noop
            }

        } // catch
    } // main
} // TestURL
