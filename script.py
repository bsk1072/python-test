from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Flask running on  Docker Container!!"


if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0')
