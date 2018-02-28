package model;

/**
 * Created by user on 04.11.2017.
 */
public class Pathway {
    private int origin;
    private int destination;
    private long win;
    private Pathway pathway;

    public Pathway getPathway() {
        return pathway;
    }

    public void setPathway(Pathway pathway) {
        this.pathway = pathway;
    }

    public int getDestination() {
        return destination;
    }

    public void setDestination(int destination) {
        this.destination = destination;
    }

    public int getOrigin() {
        return origin;
    }

    public void setOrigin(int origin) {
        this.origin = origin;
    }

    public long getWin() {
        return win;
    }

    public void setWin(long win) {
        this.win = win;
    }
}
