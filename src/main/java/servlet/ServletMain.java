package servlet;

        import com.google.maps.GeoApiContext;
        import dao.Connect;
        import dao.Database;
        import Math.Logistic;
        import javax.servlet.ServletException;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.*;
        import java.net.InetAddress;
        import java.net.Socket;
        import java.sql.SQLException;


/**
 * Created by user on 31.10.2017.
 */
public class ServletMain extends HttpServlet {
    private int NUMBER_OF_POINTS = 6;
    private static final int SERVER_PORT = 6666;
    private static final String IP_ADDRESS = "127.0.0.1";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
        System.out.println(req.getParameter("coordinates"));
        System.out.println(req.getParameter("id"));
        int i = Integer.parseInt(req.getParameter("counter"));
        int id_point =Integer.parseInt(req.getParameter("id"));

       String adr = (deTransormFromAdress(req.getParameter("adress")));
        System.out.println(adr);

            if (req.getParameter("type").matches("depo")){
                try {
                    database.update(1, "school", req.getParameter("coordinates"), "0", adr);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else{

                int number = Integer.parseInt(req.getParameter("number_"));
                try {
                    database.update(i, "point"+(i-1), req.getParameter("coordinates"),req.getParameter("number_"), adr);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        try {
            database.updatePointsNumber((id_point-1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
       /* NUMBER_OF_POINTS = Integer.parseInt(req.getParameter("points"));*/


    /*    try {
            database.updatePointsNumber(Integer.parseInt(req.getParameter("points")));
            database.update(1, "school", req.getParameter("school"), "0");
            for (int i=2; i<=NUMBER_OF_POINTS; i++){
                database.update(i, "point"+(i-1), req.getParameter("point"+(i-1)), req.getParameter("number"+(i-1)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
*/
        try {
            Logistic logistic = new Logistic(5);
            logistic.setNUMBER_IN_BUS(Integer.parseInt(req.getParameter("number")));

            InetAddress ipAddress = InetAddress.getByName(IP_ADDRESS);
            Socket socket = new Socket(ipAddress, SERVER_PORT);


            InputStream sim = socket.getInputStream();
            DataInputStream in = new DataInputStream(sim);
            OutputStream sout = socket.getOutputStream();
            DataOutputStream out = new DataOutputStream(sout);

            String time = req.getParameter("time");
            String line = req.getParameter("number");
            out.writeUTF(time);
            out.writeUTF(line);
            out.flush();

            line = in.readUTF();
            socket.close();

        }catch (Exception e){
            e.getMessage();
        }




        req.getRequestDispatcher("index1.jsp").forward(req, resp);
    }

    public String deTransormFromAdress(String str){
        String[] newStr = str.split(",");
        String result="";
        for (int i =0; i<newStr.length; i++){
            String line = newStr[i];

            if (newStr[i].matches("111111")){
                line = "ё";
                result+= line;
            } else
            if (newStr[i].matches("111112")){
                line = "й";
                result+= line;
            }else
            if (newStr[i].matches("111113")){
                line = "ц";
                result+= line;
            }else
            if (newStr[i].matches("111114")){
                line = "у";
                result+= line;
            }else
            if (newStr[i].matches("111115")){
                line = "к";
                result+= line;
            }else
            if (newStr[i].matches("111116")){
                line = "е";
                result+= line;
            }else
            if (newStr[i].matches("111117")){
                line = "н";
                result+= line;
            }else
            if (newStr[i].matches("111118")){
                line = "г";
                result+= line;
            }else
            if (newStr[i].matches("111119")){
                line = "ш";
                result+= line;
            }else
            if (newStr[i].matches("111120")){
                line = "щ";
                result+= line;
            }else
            if (newStr[i].matches("111121")){
                line = "з";
                result+= line;
            }else
            if (newStr[i].matches("111122")){
                line = "х";
                result+= line;
            }else
            if (newStr[i].matches("111123")){
                line = "ъ";
                result+= line;
            }else
            if (newStr[i].matches("111124")){
                line = "ф";
                result+= line;
            }else
            if (newStr[i].matches("111125")){
                line = "ы";
                result+= line;
            }else
            if (newStr[i].matches("111126")){
                line = "в";
                result+= line;
            }else
            if (newStr[i].matches("111127")){
                line = "а";
                result+= line;
            }else
            if (newStr[i].matches("111128")){
                line = "п";
                result+= line;
            }else
            if (newStr[i].matches("111129")){
                line = "р";
                result+= line;
            }else
            if (newStr[i].matches("111130")){
                line = "о";
                result+= line;
            }else
            if (newStr[i].matches("111131")){
                line = "л";
                result+= line;
            }else
            if (newStr[i].matches("111132")){
                line = "д";
                result+= line;
            }else
            if (newStr[i].matches("111133")){
                line = "ж";
                result+= line;
            }else
            if (newStr[i].matches("111134")){
                line = "э";
                result+= line;
            }else
            if (newStr[i].matches("111135")){
                line = "я";
                result+= line;
            }else
            if (newStr[i].matches("111136")){
                line = "ч";
                result+= line;
            }else
            if (newStr[i].matches("111137")){
                line = "с";
                result+= line;
            }else
            if (newStr[i].matches("111138")){
                line = "м";
                result+= line;
            }else
            if (newStr[i].matches("111139")){
                line = "и";
                result+= line;
            }else
            if (newStr[i].matches("111140")){
                line = "т";
                result+= line;
            }else
            if (newStr[i].matches("111141")){
                line = "ь";
                result+= line;
            }else
            if (newStr[i].matches("111142")){
                line = "б";
                result+= line;
            }else
            if (newStr[i].matches("111143")){
                line = "ю";
                result+= line;
            }else
            if (newStr[i].matches("111144")){
                line = "Ё";
                result+= line;
            }else
            if (newStr[i].matches("111145")){
                line = "Й";
                result+= line;
            }else
            if (newStr[i].matches("111146")){
                line = "Ц";
                result+= line;
            }else
            if (newStr[i].matches("111147")){
                line = "У";
                result+= line;
            }else
            if (newStr[i].matches("111148")){
                line = "К";
                result+= line;
            }else
            if (newStr[i].matches("111149")){
                line = "Е";
                result+= line;
            }else
            if (newStr[i].matches("111150")){
                line = "Н";
                result+= line;
            }else
            if (newStr[i].matches("111151")){
                line = "Г";
                result+= line;
            }else
            if (newStr[i].matches("111152")){
                line = "Ш";
                result+= line;
            }else
            if (newStr[i].matches("111153")){
                line = "Щ";
                result+= line;
            }else
            if (newStr[i].matches("111154")){
                line = "З";
                result+= line;
            }else
            if (newStr[i].matches("111155")){
                line = "Х";
                result+= line;
            }else
            if (newStr[i].matches("111156")){
                line = "Ъ";
                result+= line;
            }else
            if (newStr[i].matches("111157")){
                line = "Ф";
                result+= line;
            }else
            if (newStr[i].matches("111158")){
                line = "Ы";
                result+= line;
            }else
            if (newStr[i].matches("111159")){
                line = "В";
                result+= line;
            }else
            if (newStr[i].matches("111160")){
                line = "А";
                result+= line;
            }else
            if (newStr[i].matches("111161")){
                line = "П";
                result+= line;
            }else
            if (newStr[i].matches("111162")){
                line = "Р";
                result+= line;
            }else
            if (newStr[i].matches("111163")){
                line = "О";
                result+= line;
            }else
            if (newStr[i].matches("111164")){
                line = "Л";
                result+= line;
            }else
            if (newStr[i].matches("111165")){
                line = "Д";
                result+= line;
            }else
            if (newStr[i].matches("111166")){
                line = "Ж";
                result+= line;
            }else
            if (newStr[i].matches("111167")){
                line = "Э";
                result+= line;
            }else
            if (newStr[i].matches("111168")){
                line = "Я";
                result+= line;
            }else
            if (newStr[i].matches("111169")){
                line = "Ч";
                result+= line;
            }else
            if (newStr[i].matches("111170")){
                line = "С";
                result+= line;
            }else
            if (newStr[i].matches("111171")){
                line = "М";
                result+= line;
            }else
            if (newStr[i].matches("111172")){
                line = "И";
                result+= line;
            }else
            if (newStr[i].matches("111173")){
                line = "Т";
                result+= line;
            }else
            if (newStr[i].matches("111174")){
                line = "Ь";
                result+= line;
            }else
            if (newStr[i].matches("111175")){
                line = "Б";
                result+= line;
            }else
            if (newStr[i].matches("111176")){
                line = "Ю";
                result+= line;
            }else
            if (newStr[i].matches("111177")){
                line = "ї";
                result+= line;
            }else
            if (newStr[i].matches("111178")){
                line = "Ї";
                result+= line;
            }else
            if (newStr[i].matches("111179")){
                line = "і";
                result+= line;
            }else
            if (newStr[i].matches("111180")){
                line = "І";
                result+= line;
            }else
            if (newStr[i].matches("111181")){
                line = "є";
                result+= line;
            }else
            if (newStr[i].matches("111182")){
                line = "Є";
                result+= line;
            }else
            if (newStr[i].matches("111183")){
                line = "ґ";
                result+= line;
            }else
            if (newStr[i].matches("111184")){
                line = "Ґ";
                result+= line;
            }else result+=line;




        }
        return result;
    }

}
