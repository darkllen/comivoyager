<%@ page import="dao.Database" %>
<%@ page import="dao.Connect" %>
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
            height: 70%;
            width: 45%;
            display: inline-block;
        }
        #map1 {
            height: 70%;
            width: 100%;
            display: inline-block;
        }
        /* Optional: Makes the sample page fill the window. */

    </style>

</head>
<body onload="initialize()" >

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
        }
        Connect connect = new Connect();
        Database database = new Database(connect.connect());
        database.updateCurrentId(database.getUserId(nick));%>
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


                        <div id="map1" ></div>
                        <div style="display: inline-block; width: 70%"><div>
                            <input required id="address" type="textbox" placeholder="Одесса" style="width: 25%">
                            <input required id="number_" type="textbox" placeholder="количество груза">
                            <input type="button" value="Показать точку" onclick="codeAddress()">
                            <input type="submit" value="Добавить точку" onclick="addPoint()">
                            <input type="button" value="Добавить склад" onclick="addDepo()">
                         </div>
                            <div style="width: 100%; display: inline-block"><form method="post" action="doPost">
                                <div>
                                <label for="number">Максимальное колчиство груза за 1 перевозку</label>
                                <input required type="text" id="number" name="number">
                            </div>
                                <div>
                                    <label for="time">Время отправления</label>
                                    <input type="time" id="time" name="time">
                                </div>

                                <div>
                                    <input type="submit" value="Вычислить маршрут">

                                </div></form>
                            </div>
                        </div>
                        <div>
                            *Максимально один склад<br>*Количество груза вводится в виде целого числа<br>Если время отправления не указано, то для расчетов используется текущее время<br>*Адресс вводится в виде "Улица Номер_Дома, Город" или любом другом словесном виде<br>*Максимум 20 точек
                        </div>


                    </div>
                </div><!-- /main -->
            </div><!-- /st-content-inner -->
        </div><!-- /st-content -->
        </div>
</div><!-- /st-container -->




    <%--<div  id="map"></div>--%>



<script type="text/javascript" charset="UTF-8">

    var id_point = 1;

    function CreateRequest()
    {
        var Request = false;

        if (window.XMLHttpRequest)
        {
            //Gecko-совместимые браузеры, Safari, Konqueror
            Request = new XMLHttpRequest();
        }
        else if (window.ActiveXObject)
        {
            //Internet explorer
            try
            {
                Request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (CatchException)
            {
                Request = new ActiveXObject("Msxml2.XMLHTTP");
            }
        }

        if (!Request)
        {
            alert("Невозможно создать XMLHttpRequest");
        }

        return Request;
    }

    var counter = 2;


    var geocoder;
    var map1;
    var marker;

    function SendRequest(r_method, r_path, r_args, r_handler)
    {
        //Создаём запрос
        var Request = CreateRequest();

        //Проверяем существование запроса еще раз
        if (!Request)
        {
            return;
        }

        //Назначаем пользовательский обработчик
        Request.onreadystatechange = function()
        {
            //Если обмен данными завершен
            if (Request.readyState == 4)
            {
                //Передаем управление обработчику пользователя
                r_handler(Request);
            }
        }

        //Проверяем, если требуется сделать GET-запрос
        if (r_method.toLowerCase() == "get" && r_args.length > 0)
            r_path += "?" + r_args;

        //Инициализируем соединение
        Request.open(r_method, r_path, true);

        if (r_method.toLowerCase() == "post")
        {
            //Если это POST-запрос

            //Устанавливаем заголовок
            Request.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
            //Посылаем запрос
            Request.send(r_args);
        }
        else
        {
            //Если это GET-запрос

            //Посылаем нуль-запрос
            Request.send(null);
        }
    }


    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(46.460833, 30.743365);
        var mapOptions = {
            zoom: 11,
            center: latlng
        }
        map1 = new google.maps.Map(document.getElementById('map1'), mapOptions);

        map1.addListener('click', function(e) {

            if(marker!=null){
                marker.setMap(null);
            }
            placeMarkerAndPanTo(e.latLng, map1);


        });

    }

    function placeMarkerAndPanTo(latLng, map1) {


        marker = new google.maps.Marker({
            position: latLng,
            map: map1,
            label: 1
        });
        map1.panTo(latLng);

        var location = latLng;

        geocoder.geocode( { 'location': location}, function(results, status) {
            console.log(location);
            console.log(results[0]);
            document.getElementById('address').value = results[0].formatted_address;

        });


    }

    var Handler = function(Request)
    {
        console.log("OK");
    }


       function codeAddress() {

        var address = document.getElementById('address').value;
           var number_ = document.getElementById('number_').value;
        var coordinates_l;
        var coordinates_p;
        var coordinates;
        geocoder.geocode( { 'address': address}, function(results, status) {


            /*coordinates_l = (parseFloat(results[0].geometry.bounds.b.b) + parseFloat(results[0].geometry.bounds.b.f)) / 2;
            coordinates_p = (parseFloat(results[0].geometry.bounds.f.b) + parseFloat(results[0].geometry.bounds.f.f)) / 2;
            coordinates_l = coordinates_l.toFixed(6);
            coordinates_p = coordinates_p.toFixed(6);
            coordinates = coordinates_p + ", " + coordinates_l;
            console.log(coordinates);*/

            coordinates = results[0].geometry.location.lat().toFixed(6) + "," + results[0].geometry.location.lng().toFixed(6);

            if (status == 'OK') {

                map1.setCenter(results[0].geometry.location);

                if(marker!=null){
                    marker.setMap(null);
                }



                marker = new google.maps.Marker({
                    map: map1,
                    position: results[0].geometry.location,
                    label:1
                });

                console.log(coordinates);

//если депо, то отдельный параметр, если не равен нулю, то добавляется


            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }


    function addPoint() {

        var address = document.getElementById('address').value;
        var number_ = document.getElementById('number_').value;
        var coordinates_l;
        var coordinates_p;
        var coordinates;
        geocoder.geocode( { 'address': address}, function(results, status) {
            coordinates = results[0].geometry.location.lat().toFixed(6) + "," + results[0].geometry.location.lng().toFixed(6);
            console.log(coordinates);
            if (status == 'OK') {

                map1.setCenter(results[0].geometry.location);

                marker = new google.maps.Marker({
                    map: map1,
                    position: results[0].geometry.location,
                    label:1
                });

//если депо, то отдельный параметр, если не равен нулю, то добавляется
  ++id_point;

                var st = transfetIntoLatin(address);
                console.log(st);
                SendRequest("GET", "doPost", "coordinates="+coordinates+"&counter="+counter+"&number_="+number_+"&type=point&id="+id_point+"&adress="+st, Handler);
                ++counter;

            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

        var depoCounter = 0;
    function addDepo() {
        if (depoCounter != 0) {
            alert("Склад уже добавлен")
        } else {
            depoCounter++;

            var address = document.getElementById('address').value;
            var number_ = document.getElementById('number_').value;
            var coordinates_l;
            var coordinates_p;
            var coordinates;
            geocoder.geocode({'address': address}, function (results, status) {
                coordinates = results[0].geometry.location.lat().toFixed(6) + "," + results[0].geometry.location.lng().toFixed(6);
                console.log(coordinates);
                if (status == 'OK') {

                    map1.setCenter(results[0].geometry.location);

                    marker = new google.maps.Marker({
                        map: map1,
                        position: results[0].geometry.location,
                        label: 1
                    });

                    var st = transfetIntoLatin(address);
                    console.log(st);
//если депо, то отдельный параметр, если не равен нулю, то добавляется
                    SendRequest("GET", "doPost", "coordinates=" + coordinates + "&counter=1&number_=" + number_ + "&type=depo&id=" + id_point + "&adress=" + st, Handler);
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
    }

        function  transfetIntoLatin(line){
            line+="";
            var newLine = [];
            for (var i = 0; i<line.length; i++){
                var symb = line.charAt(i);
                var st = "";
                newLine[i]=symb;

                if (symb=="ё"){
                    st='111111';
                    newLine[i] = st;
                }
                if (symb=="й"){
                    st='111112';     newLine[i] = st;
                }
                if (symb=="ц"){
                    st='111113';     newLine[i] = st;
                }
                if (symb=="у"){
                    st='111114';     newLine[i] = st;
                }
                if (symb=="к"){
                    st='111115';     newLine[i] = st;
                }
                if (symb=="е"){
                    st='111116';     newLine[i] = st;
                }
                if (symb=="н"){
                    st='111117';     newLine[i] = st;
                }
                if (symb=="г"){
                    st='111118';     newLine[i] = st;
                }
                if (symb=="ш"){
                    st='111119';     newLine[i] = st;
                }
                if (symb=="щ"){
                    st='111120';     newLine[i] = st;
                }
                if (symb=="з"){
                    st='111121';     newLine[i] = st;
                }
                if (symb=="х"){
                    st='111122';     newLine[i] = st;
                }
                if (symb=="ъ"){
                    st='111123';     newLine[i] = st;
                }
                if (symb=="ф"){
                    st='111124';     newLine[i] = st;
                }
                if (symb=="ы"){
                    st='111125';     newLine[i] = st;
                }
                if (symb=="в"){
                    st='111126';     newLine[i] = st;
                }
                if (symb=="а"){
                    st='111127';     newLine[i] = st;
                }
                if (symb=="п"){
                    st='111128';     newLine[i] = st;
                }
                if (symb=="р"){
                    st='111129';     newLine[i] = st;
                }
                if (symb=="о"){
                    st='111130';     newLine[i] = st;
                }
                if (symb=="л"){
                    st='111131';     newLine[i] = st;
                }
                if (symb=="д"){
                    st='111132';     newLine[i] = st;
                }
                if (symb=="ж"){
                    st='111133';     newLine[i] = st;
                }
                if (symb=="э"){
                    st='111134';     newLine[i] = st;
                }
                if (symb=="я"){
                    st='111135';     newLine[i] = st;
                }
                if (symb=="ч"){
                    st='111136';     newLine[i] = st;
                }
                if (symb=="с"){
                    st='111137';     newLine[i] = st;
                }
                if (symb=="м"){
                    st='111138';     newLine[i] = st;
                }
                if (symb=="и"){
                    st='111139';     newLine[i] = st;
                }
                if (symb=="т"){
                    st='111140';     newLine[i] = st;
                }
                if (symb=="ь"){
                    st='111141';     newLine[i] = st;
                }
                if (symb=="б"){
                    st='111142';     newLine[i] = st;
                }
                if (symb=="ю"){
                    st='111143';     newLine[i] = st;
                }
                if (symb=="Ё"){
                    st='111144)';     newLine[i] = st;
                }
                if (symb=="Й"){
                    st='111145';     newLine[i] = st;
                }
                if (symb=="Ц"){
                    st='111146';     newLine[i] = st;
                }
                if (symb=="У"){
                    st='111147';     newLine[i] = st;
                }
                if (symb=="К"){
                    st='111148';     newLine[i] = st;
                }
                if (symb=="Е"){
                    st='111149';     newLine[i] = st;
                }
                if (symb=="Н"){
                    st='111150';     newLine[i] = st;
                }
                if (symb=="Г"){
                    st='111151';     newLine[i] = st;
                }
                if (symb=="Ш"){
                    st='111152';     newLine[i] = st;
                }
                if (symb=="Щ"){
                    st='111153';     newLine[i] = st;
                }
                if (symb=="З"){
                    st='111154';     newLine[i] = st;
                }
                if (symb=="Х"){
                    st='111155';     newLine[i] = st;
                }
                if (symb=="Ъ"){
                    st='111156';     newLine[i] = st;
                }
                if (symb=="Ф"){
                    st='111157';     newLine[i] = st;
                }
                if (symb=="Ы"){
                    st='111158';     newLine[i] = st;
                }
                if (symb=="В"){
                    st='111159';     newLine[i] = st;
                }
                if (symb=="А"){
                    st='111160';     newLine[i] = st;
                }
                if (symb=="П"){
                    st='111161';     newLine[i] = st;
                }
                if (symb=="Р"){
                    st='111162';     newLine[i] = st;
                }
                if (symb=="О"){
                    st='111163';     newLine[i] = st;
                }
                if (symb=="Л"){
                    st='111164';     newLine[i] = st;
                }
                if (symb=="Д"){
                    st='111165';     newLine[i] = st;
                }
                if (symb=="Ж"){
                    st='111166';     newLine[i] = st;
                }
                if (symb=="Э"){
                    st='111167';     newLine[i] = st;
                }
                if (symb=="Я"){
                    st='111168';     newLine[i] = st;
                }
                if (symb=="Ч"){
                    st='111169';     newLine[i] = st;
                }
                if (symb=="С"){
                    st='111170';     newLine[i] = st;
                }
                if (symb=="М"){
                    st='111171';     newLine[i] = st;
                }
                if (symb=="И"){
                    st='111172';     newLine[i] = st;
                }
                if (symb=="Т"){
                    st='111173';     newLine[i] = st;
                }
                if (symb=="Ь"){
                    st='111174';     newLine[i] = st;
                }
                if (symb=="Б"){
                    st='111175';     newLine[i] = st;
                }
                if (symb=="Ю"){
                    st='111176';     newLine[i] = st;
                }
                if (symb=="ї"){
                    st='111177';     newLine[i] = st;
                }
                if (symb=="Ї"){
                    st='111178';     newLine[i] = st;
                }
                if (symb=="і"){
                    st='111179';     newLine[i] = st;
                }
                if (symb=="І"){
                    st='111180';     newLine[i] = st;
                }
                if (symb=="є"){
                    st='111181';     newLine[i] = st;
                }
                if (symb=="Є"){
                    st='111182';     newLine[i] = st;
                }
                if (symb=="ґ"){
                    st='111183';     newLine[i] = st;
                }
                if (symb=="Ґ"){
                    st='111184';     newLine[i] = st;
                }


            }
            return newLine
        }



</script>
<script>
    var map;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat:  46.475566, lng: 30.745822},

            zoom: 11
        });
    }




</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALNbm4xn2iub4w7L8SF26PV9dJCOcPo6o&callback=initMap"
        async defer>
</script>
<script src="SidebarTransitions/js/classie.js"></script>
<script src="SidebarTransitions/js/sidebarEffects.js"></script>

</body>
</html>
