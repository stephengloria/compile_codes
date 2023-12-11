# customers.py
import sqlite3

def get_customer_by_id(customer_id):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM customers WHERE customer_id=?", (customer_id,))
    customer = cursor.fetchone()
    connection.close()
    return customer

def add_customer(name):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("INSERT INTO customers (name) VALUES (?)", (name,))
    connection.commit()
    connection.close()

def get_customers():
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM customers")
    customers = cursor.fetchall()
    connection.close()
    return customers

def update_customer(customer_id, name):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("UPDATE customers SET name=? WHERE customer_id=?", (name, customer_id))
    connection.commit()
    connection.close()

def delete_customer(customer_id):
    connection = sqlite3.connect("customers.db")
    cursor = connection.cursor()
    cursor.execute("DELETE FROM customers WHERE customer_id=?", (customer_id,))
    connection.commit()
    connection.close()