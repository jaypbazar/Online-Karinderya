from flask import Flask, render_template, redirect, url_for, session

app = Flask(__name__)

@app.route('/')
def main():
    return render_template('index.html')

@app.route('/login', methods=["POST", "GET"])
def login():
    return render_template('login')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)