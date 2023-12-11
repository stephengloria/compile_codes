<!-- delete_customer.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Customer</title>
</head>
<body>
    <h1>Delete Customer</h1>
    <p>Are you sure you want to delete this customer?</p>
    <form action="/delete_customer" method="post">
        <input type="hidden" name="customer_id" value="{{customer['customer_id']}}">
        <p>Name: {{customer['name']}}</p>
        <button type="submit">Delete Customer</button>
    </form>
    <p><a href="/customer_list">Back to Customer List</a></p>
</body>
</html>
