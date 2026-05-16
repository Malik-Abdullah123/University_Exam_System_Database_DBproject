from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# =========================
# DATABASE CONNECTION
# =========================

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="uni_Exam_DB"
)

cursor = conn.cursor()


# =========================
# HOME PAGE
# =========================

@app.route('/')
def home():
    return render_template('home.html')


# =========================
# STUDENT PAGE
# =========================

@app.route('/student')
def student_page():
    return render_template('student.html')


@app.route('/add_student', methods=['POST'])
def add_student():
    id = request.form['id']
    name = request.form['name']
    dob = request.form['dob']
    email = request.form['email']
    phone = request.form['phone']
    city = request.form['city']
    zip_code = request.form['zip_code']
    street = request.form['street']

    s_ssn = request.form['s_ssn']
    program = request.form['program']
    cgpa = request.form['cgpa']

    # Insert into Person
    sql1 = "INSERT INTO Person VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    values1 = (id, name, dob, email, phone, city, zip_code, street)

    cursor.execute(sql1, values1)

    # Insert into Student
    sql2 = "INSERT INTO Student VALUES (%s,%s,%s,%s)"
    values2 = (s_ssn, program, cgpa, id)

    cursor.execute(sql2, values2)
    conn.commit()

    return "Student Added Successfully"

# =========================
# TEACHER PAGE
# =========================

@app.route('/teacher')
def teacher_page():
    return render_template('teacher.html')


@app.route('/add_teacher', methods=['POST'])
def add_teacher():
    id = request.form['id']
    name = request.form['name']
    dob = request.form['dob']
    email = request.form['email']
    phone = request.form['phone']
    city = request.form['city']
    zip_code = request.form['zip_code']
    street = request.form['street']

    t_ssn = request.form['t_ssn']
    salary = request.form['salary']
    position = request.form['position']

    sql1 = "INSERT INTO Person VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    values1 = (id, name, dob, email, phone, city, zip_code, street)

    cursor.execute(sql1, values1)
    sql2 = "INSERT INTO Teacher VALUES (%s,%s,%s,%s)"
    values2 = (t_ssn, salary, position, id)

    cursor.execute(sql2, values2)

    conn.commit()

    return "Teacher Added Successfully"


# =========================
# INSTRUCTOR PAGE
# =========================

@app.route('/instructor')
def instructor_page():
    return render_template('instructor.html')

@app.route('/add_instructor', methods=['POST'])
def add_instructor():

    id = request.form['id']
    name = request.form['name']
    dob = request.form['dob']
    email = request.form['email']
    phone = request.form['phone']
    city = request.form['city']
    zip_code = request.form['zip_code']
    street = request.form['street']

    i_ssn = request.form['i_ssn']
    salary = request.form['salary']
    rankI = request.form['rankI']

    sql1 = "INSERT INTO Person VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    values1 = (id, name, dob, email, phone, city, zip_code, street)

    cursor.execute(sql1, values1)

    sql2 = "INSERT INTO Instructor VALUES (%s,%s,%s,%s)"
    values2 = (i_ssn, salary, rankI, id)

    cursor.execute(sql2, values2)

    conn.commit()

    return "Instructor Added Successfully"


# =========================
# RUN APP
# =========================

if __name__ == '__main__':
    app.run(debug=True)

