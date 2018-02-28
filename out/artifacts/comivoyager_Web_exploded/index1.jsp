<%@ page import="dao.Database" %>
<%@ page import="dao.Connect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Point" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/icons.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/component.css" />
    <script src="SidebarTransitions/js/modernizr.custom.js"></script>
    <link href="style.css" rel="stylesheet">
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 100%;
            width: 100%;
            display: inline-block;
        }
        /* Optional: Makes the sample page fill the window. */

    </style>
</head>
<body>
<div id="st-container" class="st-container">
    <!--
        example menus
        these menus will be on top of the push wrapper
    -->

    <nav class="st-menu st-effect-9" id="menu-9">
        <%Cookie[] cookies = request.getCookies();
            String nick = "";
            for (int i = 0; i<cookies.length; i++){
                if (cookies[i].getName().matches("nickName")){
                    nick = cookies[i].getValue();
                }
            }
            Connect connect = new Connect();
        Database database = new Database(connect.connect());
            database.updateHistory(database.getUserId(nick), database.getResult());
        %>
        <h2>Здравствуйте, <%=nick%></h2>
        <ul>
            <li><a  href="index.jsp">Карта</a></li>
            <li><a  href="history.jsp">История</a></li>
            <li><a  href="logIn.jsp">Выход</a></li>

        </ul>
    </nav>

    <div class="st-pusher">

        <div class="st-content"><!-- this is the wrapper for the content -->

            <div class="st-content-inner"><!-- extra div for emulating position:fixed of the menu -->


                <div class="main clearfix" style="display: inline-block; width: 100%">
                    <div id="st-trigger-effects" class="column" style="display: inline-block">
                        <button style="height: 98%; width:5%; color: #48a770" data-effect="st-effect-9"></button>
                    </div>


<div id="main" style="display: inline-block; width: 90%">
<div style="display: inline-block; height: 76%; width: 100%">
    <div  id="map"></div>

    <%

/*        Connect connect = new Connect();
        Database database = new Database(connect.connect());*/
        String result = database.getResult();
        result = result.substring(1,result.length());
        ArrayList<String> strings = new ArrayList<String>();
        ArrayList<String> smallStrings = new ArrayList<String>();
        do{


            if ((result.substring(result.indexOf("0")-1, result.indexOf("0")+1).matches("10") || (result.substring(result.indexOf("0")-1, result.indexOf("0")+1)).matches("20") ) ){
                String result1 = result.replaceFirst("0", "");
                int c = result1.indexOf("0");
                strings.add("0" + result.substring(0, c) + "-0");
                result = result.substring(c+2, result.length());
            }else {
                strings.add("0" + result.substring(0, result.indexOf("0")) + "0");
                result = result.substring(result.indexOf("0")+1, result.length());
            }

        }   while (result.contains("0"));%>
        <%              for(int i =0; i<strings.size(); i++) {

            String c = strings.get(i);
            c = c.substring(1, c.length() - 1);
            String num = "";
            do {
                c = c.substring(1,c.length());
                num = num + " " +database.getAll().get(Integer.parseInt(c.substring(0, c.indexOf("-")))).getCoordinates();
                c = c.substring(c.indexOf("-"), c.length());
                if (c.length()==1){
                    c=   c.replace("-", "a");
                }

            } while (c.startsWith("-"));
            smallStrings.add(num);
        %>

            <button id="<%=num%>" type="button"><%=strings.get(i)%></button>

    <% } %>




</div>


<div style="width: 50%; display: block"><form method="post" action="new">


    <div style="display: block; margin-top: 60px">
        <input type="submit" value="Задать новые точки">

    </div></form>
</div>


</div>
                </div><!-- /main -->
            </div><!-- /st-content-inner -->
        </div><!-- /st-content -->
    </div>
</div><!-- /st-container -->

</div>

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDi3MOsAJqOefEozpt9Mla0jghblwy-9B8&libraries=drawing">
</script>
<script>



    var el;

    <%
              ArrayList<Point> points =  database.getAll();
               %>




  function initMap() {
      var directionsDisplay = new google.maps.DirectionsRenderer;
      var directionsService = new google.maps.DirectionsService();

      var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: new google.maps.LatLng(<%=points.get(0).getCoordinates().substring(0,8)%>, <%=points.get(0).getCoordinates().substring(10,18)%>),
            mapTypeId: 'roadmap'

        }
        );
      directionsDisplay.setMap(map);
      console.log(map);

        var features = [
            <%for (int i = 0; i<database.getPointsNumber(); i++){%>
                      {
                position: new google.maps.LatLng(<%=points.get(i).getCoordinates().substring(0,8)%>, <%=points.get(i).getCoordinates().substring(10,18)%>),
    label: '<%=i%>'
    },
                  <% }%>
            {
                position: new google.maps.LatLng(<%=points.get(database.getPointsNumber()).getCoordinates().substring(0,8)%>, <%=points.get(database.getPointsNumber()).getCoordinates().substring(10,18)%>),
                label: '<%=database.getPointsNumber()%>'
            }
        ];

        features.forEach(function(feature) {
            var marker = new google.maps.Marker({
                position: feature.position,
                label: feature.label,
                map: map
            });
        });
      var onChangeHandler = function() {
          calculateAndDisplayRoute(event, directionsService, directionsDisplay);
      };



        <%              for(int i =0; i<smallStrings.size(); i++) { %>
    document.getElementById('<%=smallStrings.get(i)%>').addEventListener("click", onChangeHandler);


    <% } %>

    }

    function calculateAndDisplayRoute(event, directionsService, directionsDisplay) {


var c = event.target.id;
        var wayps = [];

        do {
            var a = c.substring(1, 9);
            var b = c.substring(11, 20);
            console.log(a);
            c = c.substring(1, c.length);
            c = c.substring(c.search(" "), c.length);
            wayps.push({
                location: new google.maps.LatLng(a, b)
            });

        }while (c.search(" ")!=-1);







        console.log("dasd");
        directionsService.route({
            origin: new google.maps.LatLng(<%=points.get(0).getCoordinates().substring(0,8)%>, <%=points.get(0).getCoordinates().substring(10,18)%>),
            destination: new google.maps.LatLng(<%=points.get(0).getCoordinates().substring(0,8)%>, <%=points.get(0).getCoordinates().substring(10,18)%>),
            waypoints: wayps,
            travelMode: 'DRIVING'
        }, function(response, status) {
            if (status === 'OK') {

                var dirOptions = {
                    suppressMarkers: true

                }

                directionsDisplay.setOptions(dirOptions);
                console.log(  directionsDisplay.suppressMarkers);
                directionsDisplay.setDirections(response);




            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    }







</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALNbm4xn2iub4w7L8SF26PV9dJCOcPo6o&callback=initMap"
        async defer></script>
<script src="SidebarTransitions/js/classie.js"></script>
<script src="SidebarTransitions/js/sidebarEffects.js"></script>


</body>
</html>