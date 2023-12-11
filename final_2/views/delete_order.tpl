<!-- delete_order.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Order</title>
</head>
<body>
    <h1>Delete Order</h1>
    <p>Are you sure you want to delete this order?</p>
    <form action="/delete_order" method="post">
        <input type="hidden" name="order_id" value="{{order['order_id']}}">
        <p>Customer ID: {{order['customer_id']}}</p>
        <p>Product: {{order['product']}}</p>
        <button type="submit">Delete Order</button>
    </form>
    <p><a href="/order_list">Back to Order List</a></p>
</body>
</html>
