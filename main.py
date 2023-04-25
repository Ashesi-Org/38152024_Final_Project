import json
from flask import Flask, jsonify, request 

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

students_ref = db.collection("Registered Students")
posts_ref = db.collection("Posts")

app = Flask(__name__)
     
@app.route('/register', methods=['POST'])
def register_student():
    student = json.loads(request.data)
    result = students_ref.document(student["id"]).get()
    if not result.exists:
        doc = students_ref.document(student["id"])
        doc.set(student)
        return jsonify(student), 200
    return jsonify({'Message': 'Student is already registered!'})

@app.route('/update', methods=['POST'])
def update_student():
    student = json.loads(request.data)
    result = students_ref.document(student["id"]).get()
    if result.exists:
        students_ref.document(student["id"]).update(student)
        return jsonify(student), 200
    return jsonify({'error': 'Student Not Found'}), 404                      

@app.route('/retrieve', methods=['GET'])
def retrieve_student(): 
    student = json.loads(request.data) 
    result = students_ref.document(student["id"]).get()
    if student.exists:
        return result.to_dict()
    return jsonify({'error': 'Student Not Found'}), 404

@app.route('/message', methods=['POST'])
def register_post():
    post = json.loads(request.data)
    doc = posts_ref.document(post["email"])
    doc.set(post)
    return jsonify(post), 200
    
@app.route('/get_message', methods=['GET'])
def retrieve_post(): 
    student = json.loads(request.data) 
    result = posts_ref.document(student["email"]).get()
    if student.exists:
        return result.to_dict()
    return jsonify({'error': 'Student Not Found'}), 404
    
def entry_point(request):
    app_context = app.test_request_context(path=request.full_path,
                                            method=request.method)
    
    if request.data:
        app_context.request.data = request.data
    if request.headers:
        app_context.request.headers = request.headers

    app_context.push()
    response = app.full_dispatch_request()
    app_context.pop()

    return response

if __name__ == '__main__':
    app.run(debug=True)