from flask import Flask, request

app = Flask(__name__)

@app.route('/info', methods=['POST'])
def receive_info():
    # Receive data sent from the client
    data = request.json  # JSON data sent by the client
    if data:
        print("[+] Received Data:")
        for key, value in data.items():
            print(f"{key}: {value}")
        
        # Optionally, save the received data to a file
        with open("received_info.txt", "a") as file:
            file.write(str(data) + "\n")
        
        return "Data received successfully!", 200
    else:
        return "No data received!", 400

if __name__ == "__main__":
    # Start the Flask server on Kali
    app.run(host="0.0.0.0", port=8080, debug=True)
