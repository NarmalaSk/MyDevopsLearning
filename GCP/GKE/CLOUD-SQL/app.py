import mysql.connector

# ---- MySQL Connection ----
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="testdb"
)

cursor = db.cursor()

# ---- Insert Data ----
def add_user(name, email):
    query = "INSERT INTO users (name, email) VALUES (%s, %s)"
    values = (name, email)
    cursor.execute(query, values)
    db.commit()
    print("User added successfully!")

# ---- Read Data ----
def get_users():
    cursor.execute("SELECT * FROM users")
    result = cursor.fetchall()
    for row in result:
        print(row)

# ---- Main Program ----
if __name__ == "__main__":
    add_user("Shashi", "shashi@example.com")
    print("\nCurrent Users:")
    get_users()

    db.close()
