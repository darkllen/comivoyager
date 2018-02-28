

package geo;

        import com.google.gson.stream.JsonReader;
        import com.google.maps.DistanceMatrixApi;
        import com.google.maps.DistanceMatrixApiRequest;
        import com.google.maps.GeoApiContext;
        import com.google.maps.model.DistanceMatrix;
        import com.google.maps.model.TravelMode;

        import geo.model.Way;
        import org.joda.time.DateTime;

        import java.util.HashMap;
        import java.util.Map;


/**
 * Created by user on 29.10.2017.
 */

public class GoogMatrixRequest {
//TODO
    private static final String API_KEY = "AIzaSyBFpOYwQP5kiku4zb_CLnqSt8UIM2gdiGM";
    private static final GeoApiContext context = new GeoApiContext();

    public Way geoDistance(String origin, String destination, DateTime dateTime) throws Exception {

        context.setApiKey(API_KEY);
        context.setQueryRateLimit(1000,0);
        DistanceMatrixApiRequest req = DistanceMatrixApi.newRequest(context);
        DistanceMatrix trix = req.origins(origin)
                .destinations(destination)
                .mode(TravelMode.DRIVING)
                .departureTime(dateTime)
                .await();
        Way way = new Way();
        way.setDestination_addresses(trix.destinationAddresses);
        way.setOrigin_addresses(trix.originAddresses);
        way.setRows(trix.rows);
        return way;




    }


}


// AIzaSyBFpOYwQP5kiku4zb_CLnqSt8UIM2gdiGM
//AIzaSyDi3MOsAJqOefEozpt9Mla0jghblwy-9B8
//AIzaSyDkWsGO11OHg40VcxEB1jJ1gPer2J0AWOc
//AIzaSyALNbm4xn2iub4w7L8SF26PV9dJCOcPo6o