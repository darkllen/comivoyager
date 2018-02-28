package model;

import java.util.ArrayList;

/**
 * Created by user on 17.02.2018.
 */
public class HistoryPoints {
    private String coordinates;
    private Integer resultNumber;
    private String names;
    private Integer numberOfStudents;
    private String adress;

    public Integer getResultNumber() {
        return resultNumber;
    }

    public void setResultNumber(Integer resultNumber) {
        this.resultNumber = resultNumber;
    }

    public String getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(String coordinates) {
        this.coordinates = coordinates;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public Integer getNumberOfStudents() {
        return numberOfStudents;
    }

    public void setNumberOfStudents(Integer numberOfStudents) {
        this.numberOfStudents = numberOfStudents;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
}
