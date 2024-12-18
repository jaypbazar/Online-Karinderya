from flask import Flask, render_template, redirect, url_for, request, session, flash

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Needed for session management

# Temporary valid credentials
VALID_USERNAME = 'admin@gmail.com'
VALID_PASSWORD = 'password'

@app.route('/')
def main():
    return render_template('index.html')

@app.route('/login', methods=["POST", "GET"])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        if email == VALID_USERNAME and password == VALID_PASSWORD:
            session['email'] = email
            # Display like asi***@gmail.com
            email = email[:3] + '*' * 4 + email[email.index('@'):]
            return render_template('homeindex.html', email=email)
        else:
            flash('Invalid credentials. Please try again.')
            return redirect(url_for('login'))
    
    return render_template('login')

@app.route('/home')
def home():
    if 'email' in session:
        return render_template('homeindex.html')
    else:
        return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)