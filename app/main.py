from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify(status="ok")

@app.route("/version")
def version():
    return jsonify(version=os.getenv("APP_VERSION", "1.0.0"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

