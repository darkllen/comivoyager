<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 02.02.2018
  Time: 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link href="style.css" rel="stylesheet">
    <style>
        body {
            background: #76b852; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #76b852, #8DC26F);
            background: -moz-linear-gradient(right, #76b852, #8DC26F);
            background: -o-linear-gradient(right, #76b852, #8DC26F);
            background: linear-gradient(to left, #76b852, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>
<body >

<%--<div style="width: 100%; height: 100%; text-align:center" ><form method="post" action="LogIn">
<input id="nickName" name="nickName" required placeholder="Login" type="textbox"><br
><input id="password" name="password" required placeholder="Password" type="password"><br
><input id="login" type="submit" value="Вход"><button onclick="redirect()">Регистрация</button></form>
</div>--%>

<div class="login-page">
    <div class="form">
        <form class="register-form"  method="post" action="registration">
            <input required type="text" id="nickName1" name="nickName"  placeholder="name"/>
            <input required type="password" id="password1" name="password"  placeholder="password"/>
            <input required type="text" id="mail" name="mail"  placeholder="email address"/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form>
        <form class="login-form" method="post" action="LogIn">
            <input required id="nickName" name="nickName" type="text" placeholder="username"/>
            <input required id="password" name="password"  type="password" placeholder="password"/>
            <button>login</button>
            <font color="#8b0000">Логин или пароль ошибочны</font>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
        </form>
    </div>
</div>

</body>

<script>

    $('.message a').click(function(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });


</script>
</html>

