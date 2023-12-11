# orders.py
import sqlite3

def add_order(customer_id, order_item):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("INSERT INTO orders (customer_id, order_item) VALUES (?, ?)", (customer_id, order_item))
    connection.commit()
    connection.close()

def get_orders():
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM orders")
    orders = cursor.fetchall()
    connection.close()
    return orders

def update_order(order_id, order_item):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("UPDATE orders SET order_item=? WHERE order_id=?", (order_item, order_id))
    connection.commit()
    connection.close()

def delete_order(order_id):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("DELETE FROM orders WHERE order_id=?", (order_id,))
    connection.commit()
    connection.close()

def get_order_by_id(order_id):
    connection = sqlite3.connect("orders.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM orders WHERE order_id=?", (order_id,))
    order = cursor.fetchone()
    connection.close()
    return order
