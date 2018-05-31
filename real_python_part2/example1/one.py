from flask import Flask
app = Flask(__name__)
@app.route("/")
@app.route("/Welcome")

def welcome():
    return 'Welcome to CrowdVision'

if __name__=="__main__":
    app.run()