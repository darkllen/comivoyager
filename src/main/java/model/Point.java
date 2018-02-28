package model;

/**
 * Created by user on 01.11.2017.
 */
public class Point {
    private String name;
    private String coordinates;
    private int number;
    private  String adress;

    public int getNumber() {
        return number;
    }

    public void setNumber(String number) {
        int num = Integer.parseInt(number);
        this.number = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(String coordinates) {
        this.coordinates = coordinates;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
}
