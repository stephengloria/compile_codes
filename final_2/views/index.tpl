<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            background-color: #f0f8ff; /* Light Blue background */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        a {
            text-decoration: none;
            color: #FFF;
            display: block;
            margin-top: 20px;
            background-color: #CEA0AA; /* Custom color */
            padding: 15px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #45a049; /* Custom color on hover */
        }
    </style>
</head>
<body>
    <h1>Welcome to the Application!</h1>
    <a href="/customer_list">View Customer List</a>
    <a href="/order_list">View Order List</a>
</body>
</html>
