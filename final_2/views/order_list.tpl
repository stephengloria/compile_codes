<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <style>
        body {
            background-color: #E9C2C5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .outer-box {
            background-color: #FFF;
            padding: 8px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #CEA0AA;
            color: white;
        }
        .action-buttons {
            display: flex;
            margin-top: 10px;
            justify-content: flex-start;
        }
        button {
            margin-right: 10px;
            background-color: #CEA0AA;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #CEA0AA;
        }
    </style>
</head>
<body>
    <div class="outer-box">
        <h1>Order List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Customer ID</th>
                <th>Product</th>
                <th>Action</th>
            </tr>
            % for order in orders:
            <tr>
                <td>{{order[0]}}</td>
                <td>{{order[1]}}</td>
                <td>{{order[2]}}</td>
                <td>
                    <form action="/update_order/{{order[0]}}" method="get" style="display:inline;">
                        <button type="submit">Update</button>
                    </form>
                    <form action="/delete_order/{{order[0]}}" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            % end
        </table>
        <div class="action-buttons">
            <form action="/add_order" method="get">
                <button type="submit">Add Order</button>
            </form>
            <form action="/" method="get">
                <button type="submit">Go to Home</button>
            </form>
        </div>
    </div>
</body>
</html>
