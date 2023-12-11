<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            background-color: #E9C2C5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #FFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }
        button {
            background-color: #CEA0AA;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #CEA0AA;
        }
        a {
            text-decoration: none;
            color: #333;
            display: inline-block;
            margin-top: 20px; /* Adjust the margin as needed */
        }
        .back-button {
            background-color: #CEA0AA;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .back-button:hover {
            background-color: #CEA0AA;
        }
    </style>
</head>
<body>
    <form action="/add_customer" method="post">
        <h2 style="text-align: center;">Add Customer</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Add Customer</button>
        <a href="/customer_list"><button class="back-button" type="button">Back to Customer List</button></a>
    </form>
</body>
</html>
