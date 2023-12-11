<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Order</title>
    <style>
        body {
            background-color: #E9C2C5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #333;
        }
        form {
            background-color: #FFF;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 20px;
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
    <h1>Add Order</h1>
    <form action="/add_order" method="post">
        <label for="customer_id">Customer ID:</label>
        <input type="number" id="customer_id" name="customer_id" required>
        <label for="product">Product:</label>
        <input type="text" id="product" name="product" required>
        <button type="submit">Add Order</button>
        <a href="/order_list"><button class="back-button" type="button">Back to Order List</button></a>
    </form>
</body>
</html>
