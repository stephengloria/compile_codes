<!-- welcome.tpl -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            background-color: #CEA0AA; /* Light Blue background */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
             font-family: 'Caveat', cursive;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            color: #333;
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Welcome to the Application!</h1>
    <a href="/customer_list">View Customer List</a>
    <a href="/order_list">View Order List</a>
    <a href="/combined_list">View Combined List</a>
</body>
</html>
