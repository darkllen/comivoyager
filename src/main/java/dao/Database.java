package dao;

        import model.History;
        import model.HistoryPoints;
        import model.Point;

        import java.io.UnsupportedEncodingException;
        import java.sql.ResultSet;
        import java.sql.SQLException;
        import java.sql.Statement;
        import java.text.DateFormat;
        import java.text.SimpleDateFormat;
        import java.util.ArrayList;
        import java.util.Date;

/**
 * Created by user on 01.11.2017.
 */
public class Database {
    private static   Statement statement;

    public Database(Statement statement) {
        this.statement = statement;
    }


    public void update(int id, String name, String coordinates,String number, String adress) throws SQLException, UnsupportedEncodingException {
        String db_string = adress;
        System.out.println(db_string);
        Statement st = statement;
        String query = "\n" +
                "UPDATE point SET name='"+name+"', coordinates='"+coordinates+"', number_of_students='"+ number+ "', adress='"+db_string+"' WHERE id="+id;

        st.executeUpdate(query);
    }

    public ArrayList<Point> getAll() throws SQLException {
        Statement st = statement;
        String query = "SELECT * from point";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Point> points = new ArrayList<Point>();

        while (rs.next()) {
            Point point = new Point();
            point.setName(rs.getString("name"));
            point.setCoordinates(rs.getString("coordinates"));
            point.setNumber(rs.getString("number_of_students"));
            point.setAdress(rs.getString("adress"));
            points.add(point);
        }

        return points;
    }

    public int getPointId(String coordinates) throws SQLException {
        Statement st = statement;
        String query = "SELECT id from point WHERE coordinates=\""+coordinates+"\"";
        ResultSet rs = st.executeQuery(query);
       int id = 0;

        while (rs.next()) {
            id = rs.getInt("id");
        }

        return id;
    }


    public void updateDistancesMatrix(long[][] distances) throws SQLException {
        Statement st = statement;
        for (int i =0; i<distances.length; i++){
            System.out.println(distances.length);
            for (int j = 0; j< distances[i].length; j++){
                String query = "\n" +
                        "UPDATE Distances_Matrix SET `"+j+"`='"+distances[i][j]+"' WHERE id="+(i+1);
                System.out.println(query);
                st.executeUpdate(query);
            }
        }

    }

    public void updatePointsNumber(int number) throws SQLException {


                String query = "\n" +
                        "UPDATE Points_number SET `number`='"+number+"' WHERE id="+1;
                System.out.println(query);
                statement.executeUpdate(query);
            }

    public void updateHistory(int number, String result) throws SQLException {
        Statement st = statement;

        String query = "\n" +
                "UPDATE history SET `id`='"+number+"' WHERE result=\""+result+"\"";
        System.out.println(query);
        st.executeUpdate(query);
    }


    public void updateCurrentId(int number) throws SQLException {
        Statement st = statement;

        String query = "\n" +
                "UPDATE current_id SET `id`='"+number+"' WHERE current_idcol="+1;
        System.out.println(query);
        st.executeUpdate(query);
    }

    public int getPointsNumber() throws SQLException {
        Statement st = statement;

        String query = "SELECT * from points_number";
        ResultSet rs = st.executeQuery(query);
        int number = 20;
        while (rs.next()) {
                number = rs.getInt("number");
        }

        return number;
    }

    public int getCurrentId() throws SQLException {
        Statement st = statement;

        String query = "SELECT * from current_id";
        ResultSet rs = st.executeQuery(query);
        int number = 0;
        while (rs.next()) {
            number = rs.getInt("id");
        }

        return number;
    }



    public void updateWinMatrix(long[][] win) throws SQLException {
        Statement st = statement;
        for (int i=1; i<win.length; i++){
            System.out.println(win.length);
            for (int j = 1; j< win[i].length; j++){
                String query = "\n" +
                        "UPDATE Win_Matrix SET `"+j+"`='"+win[i][j]+"' WHERE id="+i;
                System.out.println(query);
                st.executeUpdate(query);
            }
        }

    }

    public long[][] getDistancesMatrix() throws SQLException {
        Statement st = statement;
        long[][] disctancesMatrix = new long[21][21];
        String query = "\n" +
                "Select * from  Distances_Matrix";
        ResultSet rs =  st.executeQuery(query);
        int i = 0;
        int j = 0;
        while (rs.next()){
            for (i=0;i<disctancesMatrix.length;i++){
                for (j=0;j<disctancesMatrix.length;j++) {
                    disctancesMatrix[i][j] = rs.getLong(j+2);
                    System.out.println(disctancesMatrix[i][j]);
                }
                rs.next();
            }


        }

        int number = getPointsNumber();

        long[][] shortDistance = new long[number+1][number+1];
        for (i=0;i<shortDistance.length;i++){
            for (j=0;j<shortDistance.length;j++){
                shortDistance[i][j] =disctancesMatrix[i][j];
            }
        }

        return shortDistance;
    }

    public long[][] getWinMatrix() throws SQLException {
        Statement st = statement;
        long[][] winMatrix = new long[20][20];
        String query = "\n" +
                "Select * from  Win_Matrix";
        ResultSet rs =  st.executeQuery(query);
        int i = 0;
        int j = 0;
        while (rs.next()){
            for (i=0;i<winMatrix.length;i++){
                for (j=0;j<winMatrix.length;j++) {
                    winMatrix[i][j] = rs.getLong(j+2);
                }
                rs.next();
            }


        }

        int number = getPointsNumber();

        long[][] shortDistance = new long[number][number];
        for (i=0;i<shortDistance.length;i++){
            for (j=0;j<shortDistance.length;j++){
                shortDistance[i][j] =winMatrix[i][j];
            }
        }

        return shortDistance;
    }

    public String getResult() throws SQLException {
        Statement st = statement;
        String query = "SELECT * from result";
        ResultSet rs = st.executeQuery(query);
        String result = "";
        while (rs.next()) {
            result = rs.getString("result");
        }

        return result;
    }

    public void updateResult(String result) throws SQLException {
        Statement st = statement;
        String query = "\n" +
                "UPDATE result SET `result`='"+result+"' WHERE id="+1;
        st.executeUpdate(query);
    }

    public void updatePointsHisID(int result, String coordinates) throws SQLException {
        Statement st = statement;
        String query = "\n" +
                "UPDATE all_points SET `his_id`="+result+" WHERE coordinates=\""+coordinates +"\"";
        st.executeUpdate(query);
    }

    public void addNewUser(String nickName, String mail, String password) throws SQLException {
        Statement st = statement;
        String query = "insert into users (nickName, mail, password)  values ('" +nickName+ "', '" +mail+"', '"+password+ "')";
        st.executeUpdate(query);
    }

    public String getPassword(String nickName) throws SQLException {
        Statement st = statement;
        String query = "SELECT password from users WHERE nickName = '" +nickName+"'";
        ResultSet rs = st.executeQuery(query);
        String result = "";
        while (rs.next()) {
            result = rs.getString("password");
        }

        return result;
    }

    public int getUserId(String nickName) throws SQLException {
        Statement st = statement;
        String query = "SELECT id from users WHERE nickName = '" +nickName+"'";
        ResultSet rs = st.executeQuery(query);
        String result = "";
        while (rs.next()) {
            result = rs.getString("id");
        }
        int res = Integer.parseInt(result);

        return res;
    }


    public void addNewResult(String result) throws SQLException {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        Statement st = statement;
        String query = "insert  into history (result, data) values (\""+result+"\",\""+time+"\")";
        st.executeUpdate(query);
    }

    public void addAllPoints(int number,String coordinates,int user_id,String name,int number_of_students, int his_id, String adress) throws SQLException {
        Statement st = statement;
        String query = "insert  into all_points (number, coordinates, user_id, name, number_of_students, his_id, adress) values ("+number+", \""+coordinates+"\","+user_id+",\""+name+"\","+number_of_students+","+his_id+",\""+adress+"\")";
        st.executeUpdate(query);
    }


    public int getHistoryId(String result) throws SQLException {
        Statement st = statement;
        String query = "SELECT id_his from history WHERE result = '" +result+"'";
        ResultSet rs = st.executeQuery(query);
        int res = 0;
        while (rs.next()) {
            res = rs.getInt("id_his");
        }

        return res;
    }


    public ArrayList<History> getAllHistory(int currentId) throws SQLException {

        String query = "SELECT * from history WHERE id="+currentId+" ORDER BY id_his DESC";
        ResultSet rs = statement.executeQuery(query);
        ArrayList<History> histories = new ArrayList<History>();
        while (rs.next()) {
            History history = new History();
            System.out.println(rs.getString("data"));
            history.setData(rs.getString("data"));
            history.setHistoryId(rs.getInt("id_his"));
            history.setResult(rs.getString("result"));
            history.setUserId(rs.getInt("id"));

/*            history.setCoordinates(getCoordinates(rs.getInt("id_his")));*/

   /*         String queryInner = "SELECT * from all_points WHERE his_id="+history.getHistoryId();
            ResultSet rsInner = st.executeQuery(queryInner);

            ArrayList<String> coordinates = new ArrayList<String>();
                ArrayList<String> names = new ArrayList<String>();
                ArrayList<Integer> numberOfStudents = new ArrayList<Integer>();
                ArrayList<Integer> resultNumber = new ArrayList<Integer>();

                while (rsInner.next()){
                    coordinates.add(rsInner.getString("coordinates"));
                    names.add(rsInner.getString("name"));
                    numberOfStudents.add(rsInner.getInt("number_of_students"));
                    resultNumber.add(rsInner.getInt("number"));

            }

            history.setCoordinates(coordinates);
            history.setNames(names);
            history.setNumberOfStudents(numberOfStudents);
            history.setResultNumber(resultNumber);*/

            histories.add(history);
        }

        return histories;
    }


    public ArrayList<HistoryPoints> getHistoryPoints(int hisId) throws SQLException {

        String query = "SELECT * from all_points WHERE his_id="+hisId;
        ResultSet rs = statement.executeQuery(query);

        ArrayList<HistoryPoints> pointses = new ArrayList<HistoryPoints>();
        while (rs.next()) {
            HistoryPoints point = new HistoryPoints();
            point.setCoordinates(rs.getString("coordinates"));
            point.setNames(rs.getString("name"));
            point.setNumberOfStudents(rs.getInt("number_of_students"));
            point.setResultNumber(rs.getInt("number"));
            point.setAdress(rs.getString("adress"));

            pointses.add(point);
        }

        return pointses;
    }

}
/* create table `point` (
        `id` int(10) auto_increment primary key,
        `name` varchar(20),
        `coordinates` varchar(50)
         )
         alter table point add number_of_students varchar(10);
         */
/*
* 46.479720,30.735615
* 46.476482,30.725007
* 46.478510,30.725000
* 46.488889,30.728212
* 46.487603,30.725815
* 46.473713,30.744436
* */

/*create table `Distances_Matrix` (
		`id` int(20) auto_increment primary key,
        `0` int(20),
        `1` int(20),
        `2` int(20),
        `3` int(20),
        `4` int(20),
        `5` int(20)
         )*/