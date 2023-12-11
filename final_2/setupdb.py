import sqlite3

def create_customers_table():
    with sqlite3.connect("customers.db") as connection_customers:
        cursor_customers = connection_customers.cursor()
        cursor_customers.execute("CREATE TABLE IF NOT EXISTS customers (customer_id INTEGER PRIMARY KEY, name TEXT)")
        connection_customers.commit()

def create_orders_table():
    with sqlite3.connect("orders.db") as connection_orders:
        cursor_orders = connection_orders.cursor()
        cursor_orders.execute("CREATE TABLE IF NOT EXISTS orders (order_id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, FOREIGN KEY (customer_id) REFERENCES customers (customer_id))")
        connection_orders.commit()

def insert_sample_data():
    with sqlite3.connect("customers.db") as connection_customers:
        cursor_customers = connection_customers.cursor()
        cursor_customers.executemany("INSERT INTO customers (name) VALUES (?)", [("John Doe",), ("Jane Smith",), ("Bob Johnson",)])
        connection_customers.commit()

    with sqlite3.connect("orders.db") as connection_orders:
        cursor_orders = connection_orders.cursor()
        cursor_orders.executemany("INSERT INTO orders (customer_id, product) VALUES (?, ?)", [(1, "Product A"), (2, "Product B"), (3, "Product C")])
        connection_orders.commit()

def view_data():
    with sqlite3.connect("customers.db") as connection_customers:
        cursor_customers = connection_customers.cursor()
        cursor_customers.execute("SELECT * FROM customers")
        customers = cursor_customers.fetchall()

    with sqlite3.connect("orders.db") as connection_orders:
        cursor_orders = connection_orders.cursor()
        cursor_orders.execute("SELECT * FROM orders")
        orders = cursor_orders.fetchall()

    print("Customers:")
    print(customers)

    print("\nOrders:")
    print(orders)

def update_data():
    with sqlite3.connect("customers.db") as connection_customers:
        cursor_customers = connection_customers.cursor()
        cursor_customers.execute("UPDATE customers SET name=? WHERE customer_id=?", ("Updated Name", 1))
        connection_customers.commit()

    with sqlite3.connect("orders.db") as connection_orders:
        cursor_orders = connection_orders.cursor()
        cursor_orders.execute("UPDATE orders SET product=? WHERE order_id=?", ("Updated Product", 1))
        connection_orders.commit()

def delete_data():
    with sqlite3.connect("customers.db") as connection_customers:
        cursor_customers = connection_customers.cursor()
        cursor_customers.execute("DELETE FROM customers WHERE customer_id=?", (1,))
        connection_customers.commit()

    with sqlite3.connect("orders.db") as connection_orders:
        cursor_orders = connection_orders.cursor()
        cursor_orders.execute("DELETE FROM orders WHERE order_id=?", (1,))
        connection_orders.commit()

if __name__ == "__main__":
    create_customers_table()
    create_orders_table()
    insert_sample_data()
    view_data()
    update_data()
    view_data()
    delete_data()
    view_data()
