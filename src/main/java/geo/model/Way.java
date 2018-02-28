package geo.model;

        import com.google.maps.model.DistanceMatrixRow;

/**
 * Created by user on 01.11.2017.
 */
public class Way {
    private String[] destination_addresses;
    private String[]  origin_addresses;
    private DistanceMatrixRow[] rows;

    public String[] getDestination_addresses() {
        return destination_addresses;
    }

    public void setDestination_addresses(String[] destination_addresses) {
        this.destination_addresses = destination_addresses;
    }

    public String[] getOrigin_addresses() {
        return origin_addresses;
    }

    public void setOrigin_addresses(String[] origin_addresses) {
        this.origin_addresses = origin_addresses;
    }

    public DistanceMatrixRow[] getRows() {
        return rows;
    }

    public void setRows(DistanceMatrixRow[] rows) {
        this.rows = rows;
    }


}
