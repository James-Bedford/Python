#Import Flask class
from flask import Flask
#create application object
app = Flask(__name__)
# use decorator pattern
# to link the view function to a url
@app.route("/")
@app.route("/hello")
@app.route("/test2")
@app.route("/index")

#define the view using a function, while returns a string
def hello_world():
	return "Crowd Vision Configuration2"
#Start the development server
if __name__ == "__main__":
	app.run()
