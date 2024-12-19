from flask import flash, redirect, url_for
import mysql.connector, hashlib

def connectSQL():
    return mysql.connector.connect(
        host = "localhost",
        user = "root",
        password = "",
        database = "okdb"
    )

def encrypt(password):
    return hashlib.sha256(password.encode()).hexdigest()

def validate_duplicate(column_name: str, data: str) -> None:
    '''
A function that validates the user input from a form for its uniqueness
    
Parameters:
    column_name - the name of the table column from the database
    
    data - the current value to validate
    
Returns:
    redirect() - redirects the user to same page then display error message if duplicate'''
    
    try:
        conn = connectSQL()
        cursor = conn.cursor()

        query = f"SELECT {column_name} FROM users"
        cursor.execute(query)

        data = data.lower()
        list = [row[0].lower() for row in cursor.fetchall()]

        cursor.close()
        print(data)
        print(list)

        if data in list: 
            flash(f"Error: {column_name} already exists!", "danger")
            return redirect(url_for('signup'))

    except Exception as e:
        print(f"Database Error: {e}")