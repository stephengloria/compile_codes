<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Combined List</title>
</head>
<body style="background-color: #E9C2C5; display: flex; justify-content: center; align-items: center; height: 90vh; margin: 0;">

    <div style="background-color: #FFF; padding: 8px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">

        <h1 style="color: #333;">Combined List</h1>

        <h2>Customers:</h2>
        <table border="1" style="width: 100%; margin-top: 20px; border-collapse: collapse;">
            <tr>
                <th style="background-color: #CEA0AA; color: white; padding: 8px; text-align: left;">ID</th>
                <th style="background-color: #CEA0AA; color: white; padding: 8px; text-align: left;">Name</th>
            </tr>
            % for customer in customers:
            <tr>
                <td>{{customer[0]}}</td>
                <td>{{customer[1]}}</td>
            </tr>
            % end
        </table>

        <h2>Orders:</h2>
        <table border="1" style="width: 100%; margin-top: 20px; border-collapse: collapse;">
            <tr>
                <th style="background-color: #CEA0AA; color: white; padding: 8px; text-align: left;">ID</th>
                <th style="background-color: #CEA0AA; color: white; padding: 8px; text-align: left;">Customer ID</th>
                <th style="background-color: #CEA0AA; color: white; padding: 8px; text-align: left;">Product</th>
            </tr>
            % for order in orders:
            <tr>
                <td>{{order[0]}}</td>
                <td>{{order[1]}}</td>
                <td>{{order[2]}}</td>
            </tr>
            % end
        </table>

    </div>

</body>
</html>
