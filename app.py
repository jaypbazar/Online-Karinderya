from flask import Flask, render_template, redirect, url_for, flash, session, request
from backend import *
import html

app = Flask(__name__)
app.secret_key = '@pp_5ecr3t_K3y'

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        selected_eatery = request.form.get('selected_eatery')
        
        session['selected_eatery'] = html.unescape(selected_eatery)

        return redirect(url_for('dashboard'))
    
    # retrieve eatery locations from database
    try:
        eateries = []

        conn = connectSQL()
        cursor = conn.cursor()

        query = "SELECT * FROM eateries"

        cursor.execute(query)

        for row in cursor.fetchall():
            eateries.append({
                'name': row[0],
                'lat': row[1],
                'lng': row[2]
            })

    except Exception as e:
        flash("Error: could not fetch map data from database", "danger")
        print(f'Index Error: {e}')

    return render_template('index.html', eatery_list=eateries)

@app.route('/dashboard')
def dashboard():
    try:
        conn = connectSQL()
        cursor = conn.cursor()

        query = "SELECT * FROM dishes WHERE seller = %s"
        values = (session.get('selected_eatery'),)

        cursor.execute(query, values)

        dishes = []
        for row in cursor.fetchall():
            dishes.append({
                'name': row[0],
                'url': row[1],
                'price': row[2],
                'status': row[3]
            })
        
    except Exception as e:
        flash('Error: Could not select eatery.', 'danger')
        print(f'Eatery Selection Error: {e}')

    return render_template('dashboard.html', dishes=dishes)

@app.route('/login', methods=["POST", "GET"])
def login():
    if request.method == "POST":
        email = request.form.get('email')
        password = encrypt(request.form.get('password'))
        
        try:
            conn = connectSQL()

            cursor = conn.cursor()

            query = "SELECT * FROM users WHERE email = %s and password = %s"
            values = (email, password)

            cursor.execute(query, values)

            user = cursor.fetchone()

            session['user'] = user[0]
            session['user_role'] = user[3]

            return redirect(url_for('index'))

        except Exception as e:
            flash("Error connecting to database.", "danger")
            print(f"Login Error: {e}")

    return render_template('login.html')

@app.route('/signup', methods=["POST", "GET"])
def signup():
    if request.method == "POST":
        firstName = request.form.get('first_name')
        middleName = request.form.get('middle_name')
        lastName = request.form.get('last_name')
        contact = request.form.get('contact')
        role = request.form.get('role')
        email = request.form.get('email')
        password = encrypt(request.form.get('password'))

        try:
            conn = connectSQL()

            cursor = conn.cursor()

            query = "INSERT INTO users(first_name, middle_name, last_name, email, password, phone_number, role) VALUES(%s, %s, %s, %s, %s, %s, %s)"
            values = (firstName, middleName, lastName, email, password, contact, role)

            cursor.execute(query, values)
            conn.commit()

            return redirect(url_for('login'))
        
        except Exception as e:
            flash("Error signing up.", "danger")
            print(f'Signup Error: {e}')
        
    return render_template('signup.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)