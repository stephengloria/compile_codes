<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order</title>
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
            display: flex;
            flex-direction: column;
            align-items: center;
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
        input[type="submit"] {
            background-color: #CEA0AA;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #CEA0AA;
        }
    </style>
</head>
<body>
    <form action="/update_order" method="post">
        <h1>Update Order</h1>
        <label for="product">Product:</label>
        <input type="text" id="product" name="product" value="{{order[2]}}" required>
        <input type="hidden" name="order_id" value="{{order[0]}}">
        <input type="submit" value="Update Order">
    </form>
</body>
</html>
