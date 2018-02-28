package model;

import java.util.ArrayList;

/**
 * Created by user on 17.02.2018.
 */
public class History {
    private String result;
    private String data;
    private int historyId;
    private int userId;
private ArrayList<HistoryPoints> pointses;


    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public ArrayList<HistoryPoints> getPointses() {
        return pointses;
    }

    public void setPointses(ArrayList<HistoryPoints> pointses) {
        this.pointses = pointses;
    }
}
