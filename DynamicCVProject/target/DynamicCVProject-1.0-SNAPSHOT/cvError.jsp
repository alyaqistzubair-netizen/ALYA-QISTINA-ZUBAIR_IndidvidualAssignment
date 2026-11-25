
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Validation Error</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            text-align: center;
            padding: 100px;
        }

        .error-box {
            background: white;
            padding: 40px;
            width: 450px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #dc3545;
        }

        p {
            color: #555;
        }

        a {
            display: inline-block;
            background: #263859;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="error-box">

    <h1>Validation Error!</h1>

    <p>${errorMessage}</p>

    <p>Please return to the form and correct your information.</p>

    <a href="${pageContext.request.contextPath}/CVServlet">
        Back to CV Form
    </a>

</div>

</body>
</html>
