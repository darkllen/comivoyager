package Math;


        import dao.Connect;
        import dao.Database;
        import geo.GoogMatrixRequest;
        import geo.model.Way;
        import model.Pathway;
        import model.Point;
        import org.joda.time.DateTime;

        import java.sql.SQLException;
        import java.util.ArrayList;
        import java.util.Collections;
        import java.util.LinkedList;


public class Logistic {

    public Logistic(int number){
        number_in_bus = number;
    }

    private int number_in_bus = 24;

    public int getNUMBER_IN_BUS() {
        return number_in_bus;
    }

    public void setNUMBER_IN_BUS(int NUMBER_IN_BUS) {
        this.number_in_bus = NUMBER_IN_BUS;
    }

    public ArrayList<Integer> ClarkRight(long[][] win) throws SQLException {
        System.out.println(number_in_bus);
        int y = 0;
        int dest = 0;
        int numberSum = 0;
        Pathway pathway = null;
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
        database.getWinMatrix();
        ArrayList<Integer> arrayList = new ArrayList();
        ArrayList<Point> points = database.getAll();
        ArrayList<Point> pointsForDatabase = database.getAll();


        ArrayList<Integer> list_number = new ArrayList();

        for (int i = 0; i<database.getPointsNumber()+1;i++){
            list_number.add(points.get(i).getNumber());
            Collections.sort(list_number);}

        int check = 0;
        int count = 2;


        while (getMaxWin(win).getWin() != 0) {
            int size = arrayList.size();
            for (int a = 0; a<size; a++){
                if (arrayList.get(a)!=0){
                    check++;
                    points.get(arrayList.get(a)).setNumber("5000");
                    for (int i = 0; i<database.getPointsNumber()+1;i++){

                        list_number.add(points.get(i).getNumber());
                        Collections.sort(list_number);}
                } else {
                    check++;
                }
            }
//TODO
            for (int i = 1; i<database.getPointsNumber()+1;i++){
                if (points.get(i).getNumber()+list_number.get(1)>number_in_bus && points.get(i).getNumber()!=5000){
                    arrayList.add(0);
                    arrayList.add(i);
                    arrayList.add(0);
                    for (int f = 0; f<win.length;f++){
                        win[f][i-1]= 0;
                        win[i-1][f]=0;
                    }
                }
            }


            if (numberSum == 0) {
                arrayList.add(0);
                pathway = getMaxWin(win);
                numberSum = numberSum + points.get(pathway.getOrigin() + 1).getNumber();
                numberSum = numberSum + points.get(pathway.getDestination() + 1).getNumber();
            } else {
                numberSum = numberSum + points.get(pathway.getDestination() + 1).getNumber();
            }

            if (numberSum <=  number_in_bus) {
                arrayList.add(pathway.getOrigin() + 1);
                arrayList.add(pathway.getDestination() + 1);

                win = winMatrixUpdate(win, pathway);
                dest = pathway.getDestination();
                pathway = getMaxWin(win, dest);

            } else {
                if (count % 2 == 0) {
                    count++;
                    numberSum = 0;
                } else {
                    count++;
                    win[pathway.getOrigin()][pathway.getDestination()] = 0;
                    win[pathway.getDestination()][pathway.getOrigin()] = 0;

                }

            }


           /* System.out.println(arrayList.get(y));*/

            y++;
        }


        for (int i = 0; i <= win.length; i++) {
            if (!arrayList.contains(i)) {
                arrayList.add(i);
                arrayList.add(0);
            }

        }
        arrayList.add(0);


        getOutDuplicate(arrayList);

        for (int u = 0;u<arrayList.size();u++){
            System.out.println(arrayList.get(u));
        }

        String result = transform(arrayList);

        database.addNewResult(result);


        for (int i = 0; i<database.getPointsNumber()+1;i++){
            database.addAllPoints(database.getPointId(pointsForDatabase.get(i).getCoordinates()), pointsForDatabase.get(i).getCoordinates(), database.getCurrentId(),pointsForDatabase.get(i).getName(),pointsForDatabase.get(i).getNumber(),database.getHistoryId(result), pointsForDatabase.get(i).getAdress());
        }


/*        for (int i = 0; i<database.getPointsNumber()+1;i++){
            database.updatePointsHisID(database.getHistoryId(result), points.get(i).getCoordinates());  }*/
            return arrayList;
    }






    public long[][] getDistances(GoogMatrixRequest geo, Database database, DateTime dateTime) throws Exception {
        ArrayList<Point> points = database.getAll();
        Way a = new Way();
        int number = database.getPointsNumber();
        long[][] distances = new long[21][21];

        System.out.println(points.size());
        System.out.println(number);

        for (int i= 0; i<(number+1); i++) {
            for (int j = 0; j < (number+1); j++) {
                a = geo.geoDistance(points.get(i).getCoordinates(), points.get(j).getCoordinates(), dateTime);

                distances[i][j] = a.getRows()[0].elements[0].duration.inSeconds;
                /*System.out.println(distances[i][j]);*/
            }
        }

        long[][] shortDistance = new long[number+1][number+1];
        for (int i=0;i<shortDistance.length;i++){
            for (int j=0;j<shortDistance.length;j++){
                shortDistance[i][j] =distances[i][j];
            }
        }

        return shortDistance;
    }

    public long[][] getWin(long[][] distances) throws SQLException {
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
        int number = database.getPointsNumber();
        long[][] win = new long[number+1][number+1];
        for (int i = 1; i<win.length; i++){
            for (int j = 1; j<win[i].length; j++){
                if (i==j){
                    win[i][j]= 0;
                    System.out.println(win[i][j]);
                    continue;
                }
                win[i][j] = (int) (distances[0][i] + distances[0][j] - distances[i][j]);
                System.out.println(win[i][j]);
            }
        }
        return win;
    }


    public Pathway getMaxWin(long[][] win_matrix){
        long max = 0;
        Pathway pathway = new Pathway();
        for (int i = 0; i<win_matrix.length; i++){
            for (int j = 0; j<win_matrix[i].length; j++){
                if (win_matrix[i][j]>max){
                    max = win_matrix[i][j];
                    pathway.setOrigin(i);
                    pathway.setDestination(j);
                    pathway.setWin(max);
                }
            }
        }
        return pathway;
    }


    public Pathway getMaxWin(long[][] win_matrix, int dest){
        long max = 0;
        Pathway pathway = new Pathway();

        for (int j = 0; j<win_matrix[dest].length; j++){
            if (win_matrix[dest][j]>max){
                max = win_matrix[dest][j];
                pathway.setOrigin(dest);
                pathway.setDestination(j);
                int a;
                pathway.setWin(max);

            }
        }
        return pathway;
    }




    public long[][] winMatrixUpdate(long[][] win, Pathway pathway){
        for (int i = 0; i<win.length; i++){
            win[pathway.getOrigin()][i] = 0;
            win[i][pathway.getOrigin()] = 0;
            win[i][pathway.getDestination()] = 0;
        }
        return  win;
    }

    public ArrayList getOutDuplicate(ArrayList<Integer> arrayList){

        for (int i = 0; i<arrayList.size();i++){
            int original = arrayList.get(i);
            for (int j = i+1; j<arrayList.size();j++){
                if (original!= 0 && original==arrayList.get(j)){
                    arrayList.remove(j);
                }else if (original==0 && arrayList.get(i+1)==0){
                    arrayList.remove(i+1);
                    j--;
                }
            }
        }


        return arrayList;
    }


    public String transform(ArrayList<Integer> arrayList){
        String result = "";
        for (int i = 0;i<arrayList.size();i++){
            result = result + arrayList.get(i) + "-";
        }
       result =  result.substring(0, result.length()-1);
        return result;
    }




}
