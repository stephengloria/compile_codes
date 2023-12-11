# from bottle import route, run, template, request, redirect, post, debug
# import sqlite3
# from customer import get_customer_by_id
# from order import get_order_by_id

from bottle import route, run, template, request, redirect, post, debug
import sqlite3
from customer import get_customer_by_id, get_customers, add_customer, update_customer, delete_customer
from order import get_order_by_id, get_orders, add_order, update_order, delete_order

@route('/')
def index():
    return template('welcome.tpl')

@route('/combined_list')
def combined_list():
    customers = get_customers()
    orders = get_orders()
    return template("combined_list.tpl", customers=customers, orders=orders)

@route('/order_list')
def order_list():
    orders = get_orders()
    return template("order_list.tpl", orders=orders)

@route('/customer_list')
def customer_list():
    customers = get_customers()
    return template("customer_list.tpl", customers=customers)


# Function to create tables
def create_tables():
    # Create customers database
    connection_customers = sqlite3.connect("customers.db")
    cursor_customers = connection_customers.cursor()
    cursor_customers.execute("CREATE TABLE IF NOT EXISTS customers (customer_id INTEGER PRIMARY KEY, name TEXT)")
    connection_customers.commit()

    # Create orders database
    connection_orders = sqlite3.connect("orders.db")
    cursor_orders = connection_orders.cursor()
    cursor_orders.execute("CREATE TABLE IF NOT EXISTS orders (order_id INTEGER PRIMARY KEY, customer_id INTEGER, product TEXT, FOREIGN KEY (customer_id) REFERENCES customers (customer_id))")
    connection_orders.commit()
    connection_customers.close()
    connection_orders.close()

# Function to add a customer
def add_customer(name):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("INSERT INTO customers (name) VALUES (?)", (name,))
    connection.commit()
    connection.close()

# Function to get all customers
def get_customers():
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM customers")
    customers = cursor.fetchall()
    connection.close()
    return customers

# Function to add an order
def add_order(customer_id, product):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("INSERT INTO orders (customer_id, product) VALUES (?, ?)", (customer_id, product))
    connection.commit()
    connection.close()

# Function to get all orders
def get_orders():
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM orders")
    orders = cursor.fetchall()
    connection.close()
    return orders

# Function to update a customer
def update_customer(customer_id, name):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("UPDATE customers SET name=? WHERE customer_id=?", (name, customer_id))
    connection.commit()
    connection.close()

# Function to update a customer
# Function to update an order
def update_order(order_id, product):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("UPDATE orders SET product=? WHERE order_id=?", (product, order_id))
    connection.commit()
    connection.close()


# Function to delete a customer
def delete_customer(customer_id):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("DELETE FROM customers WHERE customer_id=?", (customer_id,))
    connection.commit()
    connection.close()

# Function to delete an order
def delete_order(order_id):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("DELETE FROM orders WHERE order_id=?", (order_id,))
    connection.commit()
    connection.close()

@route('/update_customer/<customer_id:int>')
def update_customer_route(customer_id):
    customer = get_customer_by_id(customer_id)
    if not customer:
        redirect("/customer_list")
    return template("update_customer.tpl", customer_id=customer_id, name=customer[1])  # Pass customer_id and name as parameters

@post('/update_customer')
def update_customer_post():
    name = request.forms.get("name")
    customer_id = request.forms.get("customer_id")
    update_customer(customer_id, name)
    redirect("/customer_list")

@route('/update_order/<order_id:int>')
def update_order_route(order_id):
    order = get_order_by_id(order_id)
    if not order:
        redirect("/order_list")
    return template("update_order.tpl", order=order)

@post('/update_order')
def update_order_post():
    product = request.forms.get("product")
    order_id = request.forms.get("order_id")
    update_order(order_id, product)
    redirect("/order_list")

@route('/add_order')
def add_order_route():
    customers = get_customers()
    return template("add_order.tpl", customers=customers)

@route('/add_order', method='POST')
def add_order_post():
    customer_id = request.forms.get("customer_id")
    product = request.forms.get("product")
    add_order(customer_id, product)
    redirect("/order_list")

@route('/add_customer')
def add_customer_route():
    return template("add_customer.tpl")

@route('/add_customer', method='POST')
def add_customer_post():
    name = request.forms.get("name")
    add_customer(name)
    redirect("/customer_list")

@route('/update_customer/<customer_id:int>')
def update_customer_route(customer_id):
    customer = get_customer_by_id(customer_id)
    if not customer:
        redirect("/customer_list")
    return template("update_customer.tpl", customer=customer)

@post('/update_customer')
def update_customer_post():
    name = request.forms.get("name")
    customer_id = request.forms.get("customer_id")
    update_customer(customer_id, name)
    redirect("/customer_list")

@route('/delete_customer/<customer_id:int>')
def delete_customer_route(customer_id):
    delete_customer(customer_id)
    redirect("/customer_list")

@post('/delete_customer/<customer_id:int>')
def delete_customer_route(customer_id):
    delete_customer(customer_id)
    redirect("/customer_list")

@route('/delete_order/<order_id:int>', method='POST')
def delete_order_route(order_id):
    delete_order(order_id)
    redirect("/order_list")

@post('/delete_order')
def delete_order_post():
    order_id = request.forms.get("order_id")
    delete_order(order_id)
    redirect("/order_list")

# @route('/delete_order/<order_id:int>')
# def delete_order_route(order_id):
#     order = get_order_by_id(order_id)
#     if not order:
#         redirect("/order_list")
#     return template("delete_order.tpl", order=order)


# Uncomment the following block when you want to create tables
# if __name__ == "__main__":
#     create_tables()
# Enable debug mode
debug(True)

# Run the application
if __name__ == "__main__":
    run(host='localhost', port=8061)