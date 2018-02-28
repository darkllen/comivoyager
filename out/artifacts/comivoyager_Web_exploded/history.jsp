<%@ page import="java.sql.Connection" %>
<%@ page import="dao.Connect" %>
<%@ page import="dao.Database" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.History" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15.02.2018
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/icons.css" />
    <link rel="stylesheet" type="text/css" href="SidebarTransitions/css/component.css" />
    <script src="SidebarTransitions/js/modernizr.custom.js"></script>
    <link href="style.css" rel="stylesheet">

<style>

    #map {
        height: 100%;
        width: 100%;
        display: inline-block;
    } #divMap {
          height: 30%;
          width: 100%;
          display: inline-block;
      }

</style>

</head>
<body>
<div id="st-container" class="st-container" >
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
            }%>
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

                    <div id="main" style="width: 90%; display: inline-block">

                       <%-- <table style="text-align: center">

                        </table>--%>


                    </div>
                </div><!-- /main -->
            </div><!-- /st-content-inner -->
        </div><!-- /st-content -->
    </div>
</div><!-- /st-container -->



</body>

<script>

    <%
                      Connect connect = new Connect();
                      Database database = new Database(connect.connect());
                      ArrayList<History> histories = database.getAllHistory(database.getCurrentId());
                      for (int i = 0; i<histories.size(); i++){
                          histories.get(i).setPointses(database.getHistoryPoints(histories.get(i).getHistoryId()));
                      }

                  %>

    window.onload = genereate();

    function genereate(){

        var el = document.createElement("table");

        var rows = "";
        rows += "<tbody><thead><th style='text-align: center'>Результат</th><th style='text-align: center'>Дата</th><th></th><th></th></thead>";


        <% for (int i = 0; i <histories.size(); i++) { %>

            rows += "<tr>";



                rows += "<td style='text-align: center'><%=histories.get(i).getResult()%></td>";
                rows += "<td style='text-align: center'><%=histories.get(i).getData()%></td>";
                rows += "<td style='text-align: center'><button id='<%=histories.get(i).getHistoryId()%>' onclick=details(event)>Подробности</button></td>";
                rows += "<td style='text-align: center'><button id='<%=histories.get(i).getHistoryId()%>' onclick=createWay(event)>Построить маршрут</button></td>";

            rows += "</tr>";
        <%}%>
        rows += "</tbody>";
        el.innerHTML = rows;

        /*creation*/
        var elem = document.getElementById("main");
        elem.appendChild(el);

    }

    var geocoder;





    function details(e){
        var tb = document.getElementsByTagName("table");

        console.log(e.target.id);

        if (document.getElementById("detail")){
            document.getElementById("main").removeChild(document.getElementById("detail"))
        }
        if (document.getElementById("divMap")){
            document.getElementById("main").removeChild(document.getElementById("divMap"))
        }

        var el= document.createElement("table");
        el.id = "detail";
        var rows = "";
        rows += "<tbody><thead><th style='text-align: center'>Номер точки</th><th style='text-align: center'>Адресс</th><th style='text-align: center'>Количество груза</th></thead>";
        var id = e.target.id;

  <% for (int count =0; count<histories.size(); count++){%>

        if(id==<%=histories.get(count).getHistoryId()%>){

           <% for (int i = 0; i <histories.get(count).getPointses().size(); i++) {%>

                rows += "<tr>";



                rows += "<td style='text-align: center'><%=histories.get(count).getPointses().get(i).getResultNumber()-1%></td>";
                rows += "<td style='text-align: center'><%=histories.get(count).getPointses().get(i).getAdress()%></td>";
                rows += "<td style='text-align: center'><%=histories.get(count).getPointses().get(i).getNumberOfStudents()%></td>";

                rows += "</tr>";
            <%}%>
            rows += "</tbody>";
            el.innerHTML = rows;

            /*creation*/
            var main = document.getElementById("main");
            var elem = document.getElementById("main").firstElementChild;
            main.insertBefore(el, elem);


        }
                <%}%>

    }



    function createWay(e){


        if (document.getElementById("detail")){
            document.getElementById("main").removeChild(document.getElementById("detail"))
        }
        if (document.getElementById("divMap")){
            document.getElementById("main").removeChild(document.getElementById("divMap"))
        }
        var id = e.target.id;

        var div =  document.createElement("div");
        div.id = "divMap";
        var main = document.getElementById("main");
        var elem = document.getElementById("main").firstElementChild;
        main.insertBefore(div, elem);


        div =  document.createElement("div");
        div.id = "map";
        main = document.getElementById("divMap");
        elem = document.getElementById("divMap").firstElementChild;
        main.insertBefore(div, elem);

        <% for (int count =0; count<histories.size(); count++){%>

        if(id==<%=histories.get(count).getHistoryId()%>){

    <%

/*        Connect connect = new Connect();
        Database database = new Database(connect.connect());*/
        String result = histories.get(count).getResult();
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
                num = num + " " +histories.get(count).getPointses().get(Integer.parseInt(c.substring(0, c.indexOf("-")))).getCoordinates();
                c = c.substring(c.indexOf("-"), c.length());
                if (c.length()==1){
                    c=   c.replace("-", "a");
                }

            } while (c.startsWith("-"));
            smallStrings.add(num);
        %>

            var el = document.createElement("button");
            el.className = "butt";
            el.id ="<%=num%>";
            el.innerText ="<%=strings.get(i)%>";

            var outer = document.getElementById("divMap");
            elem = document.getElementById("main").firstElementChild;
            outer.appendChild(el);

            initMap(id);
    <% } %>

        }<%}%>

    }







        function initMap(id) {
            console.log(id);
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService();


        <% for (int count =0; count<histories.size(); count++){%>

        if(id==<%=histories.get(count).getHistoryId()%>){


        var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 11,
                    center: new google.maps.LatLng(<%=histories.get(count).getPointses().get(0).getCoordinates().substring(0,8)%>, <%=histories.get(count).getPointses().get(0).getCoordinates().substring(10,18)%>),
                    mapTypeId: 'roadmap'

                }
        );
        directionsDisplay.setMap(map);
        console.log(map);

        var features = [
            <%for (int i = 0; i<histories.get(count).getPointses().size(); i++){%>
            {
                position: new google.maps.LatLng(<%=histories.get(count).getPointses().get(i).getCoordinates().substring(0,8)%>, <%=histories.get(count).getPointses().get(i).getCoordinates().substring(10,18)%>),
                label: '<%=i%>'
            },
            <% }%>
          
        ];
            console.log(features);

        features.forEach(function(feature) {
            var marker = new google.maps.Marker({
                position: feature.position,
                label: feature.label,
                map: map
            });
        });

            var onChangeHandler = function() {
                calculateAndDisplayRoute(event, directionsService, directionsDisplay, id);
            };



            var butts = document.getElementsByClassName("butt");
            console.log(butts);
                      for(var i =0; i<butts.length; i++) {
                          console.log(butts[i].id);
            butts[i].addEventListener("click", onChangeHandler);


             }


        }
            <%}%>

    }


    function calculateAndDisplayRoute(event, directionsService, directionsDisplay, id) {


        <% for (int count =0; count<histories.size(); count++){%>

        if(id==<%=histories.get(count).getHistoryId()%>){

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
            origin: new google.maps.LatLng(<%=histories.get(count).getPointses().get(0).getCoordinates().substring(0,8)%>, <%=histories.get(count).getPointses().get(0).getCoordinates().substring(10,18)%>),
            destination: new google.maps.LatLng(<%=histories.get(count).getPointses().get(0).getCoordinates().substring(0,8)%>, <%=histories.get(count).getPointses().get(0).getCoordinates().substring(10,18)%>),
            waypoints: wayps,
            travelMode: 'DRIVING'
        }, function(response, status) {
            if (status === 'OK') {

                var dirOptions = {
                    suppressMarkers: true

                };

                directionsDisplay.setOptions(dirOptions);
                console.log(  directionsDisplay.suppressMarkers);
                directionsDisplay.setDirections(response);




            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });

        }
        <%}%>

    }




</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALNbm4xn2iub4w7L8SF26PV9dJCOcPo6o&callback=initMap"
        async defer></script>
<script src="SidebarTransitions/js/classie.js"></script>
<script src="SidebarTransitions/js/sidebarEffects.js"></script>
</html>
