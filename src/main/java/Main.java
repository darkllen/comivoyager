import Math.Logistic;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import com.mysql.fabric.Server;
        import dao.Connect;
        import dao.Database;
        import geo.GoogMatrixRequest;
import model.Pathway;
import org.joda.time.DateTime;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
        import java.net.Socket;
import java.util.ArrayList;


public class Main {
    private static int PORT = 6666;

    public static void main(String[] args) throws Exception {



/*
        GoogMatrixRequest request = new GoogMatrixRequest();
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
        Logistic logistic = new Logistic();
        int number = database.getPointsNumber();
        long[][] distances = new long[number + 1][number + 1];
        distances = logistic.getDistances(request, database);
        database.updateDistancesMatrix(distances);
        database.updateWinMatrix(logistic.getWin(distances));

        ArrayList<Integer> arrayList =  logistic.ClarkRight(database.getWinMatrix());
        System.out.println(logistic.transform(arrayList));
        database.updateResult(logistic.transform(arrayList));*/
while (true){

            try {
                ServerSocket ss = new ServerSocket(PORT);
                Socket socket = ss.accept();
                GoogMatrixRequest request = new GoogMatrixRequest();
                Connect connect = new Connect();
                Database database = new Database(connect.connect());


                InputStream sim = socket.getInputStream();
                DataInputStream in = new DataInputStream(sim);
                OutputStream sout = socket.getOutputStream();
                DataOutputStream out = new DataOutputStream(sout);

                String time = in.readUTF();
                int num = Integer.parseInt(in.readUTF());
                DateTime dateTime;
                if (time.matches("")){
                    dateTime = new DateTime();
                } else {

                    System.out.println(time);
                    System.out.println(num);

                    String curr = new DateTime().toString();


                    String compare1 = time.substring(0,2)+time.substring(3,5);
                    System.out.println(compare1);

                    String compare2 = curr.substring(11,13) + curr.substring(14,16);
                    System.out.println(compare2);

                    curr = curr.substring(0,11) + time + curr.substring(16);
                    dateTime = DateTime.parse(curr);
                    if (Integer.parseInt(compare1)<=Integer.parseInt(compare2)){
                        dateTime = dateTime.plusDays(1);
                    }
                }






                System.out.println(dateTime);


                Logistic logistic = new Logistic(num);
                int number = database.getPointsNumber();
                long[][] distances = new long[number + 1][number + 1];


                distances = logistic.getDistances(request, database, dateTime);
                database.updateDistancesMatrix(distances);
                database.updateWinMatrix(logistic.getWin(distances));

                ArrayList<Integer> arrayList =  logistic.ClarkRight(database.getWinMatrix());
                System.out.println(logistic.transform(arrayList));
                database.updateResult(logistic.transform(arrayList));



                String line = "abc";

                out.writeUTF(line);
                out.flush();

                socket.close();
                ss.close();

            } catch (Exception e) {

                e.getMessage();
            }
        }
    }
    }
