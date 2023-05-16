import mysql.connector
from prettytable import PrettyTable
import time

# Connect to MySQL database
db = mysql.connector.connect(
  host="localhost",
  user="root",
  password="MySQl1234.",
  database="library"
)

# Create a cursor object
cursor = db.cursor()

def login():
  
  while True:
    username = input("Enter your username: ")
    password = input("Enter your password: ")

    # Check if the username and password match
    query = "SELECT * FROM users WHERE username = %s AND password = %s"
    params = (username, password)

    cursor = db.cursor()
    cursor.execute(query, params)
    user = cursor.fetchone()

    if user:
        print("Login successful!")
        display_books()
        break
      
    else:
        print("Invalid username or password. Please try again.")

        choice = input("Do you want to sign up? (y/n): ")

        if choice.lower() == "y":
            student_signup()
            break

# Define function for student sign up
def student_signup():
    
    print("Enter your details-")
    name = input("Name: ")
    username = input('Username: ')
    email = input("Email: ")
    password = input("Password: ")
    
    query = "SELECT * FROM users WHERE username = %s"
    params = (username,)

    cursor = db.cursor()
    cursor.execute(query, params)
    user = cursor.fetchone()

    if user:
        print("Username already exists. Please try again.")
    else:
        # Insert new user into the database
        query = "INSERT INTO users (name, username, email, password) VALUES (%s, %s, %s, %s)"
        params = (name, username, email, password)

        cursor.execute(query, params)
        db.commit()
        
        print("\nUser signup successful!")
        time.sleep(1.5)
        display_books()
# Call function for student sign up


# Function to display books
def display_books():
    page_size = 10
    page_number = 1

    while True:
        # Retrieve books from the database based on pagination
        query = "SELECT title, author, publisher, isbn, quantity FROM books LIMIT %s OFFSET %s"
        params = (page_size, (page_number - 1) * page_size)

        cursor = db.cursor()
        cursor.execute(query, params)
        books = cursor.fetchall()

        # Create a table to display books
        table = PrettyTable()
        table.field_names = ["Book", "Author", "Publisher", "ISBN", "Quantity"]
        
        for book in books:
            table.add_row(book)

        # Print the table
        print(table)

        # Check if there are more books to display
        query = "SELECT COUNT(*) FROM books"
        cursor.execute(query)
        total_books = cursor.fetchone()[0]

        if page_number * page_size >= total_books:
            print("No more books to display.")
            break
        
        # Ask the user if they want to see more books
        choice = input("Do you want to see more books? (y/n): ")

        if choice.lower() != "y":
            break

        # Increment the page number
        page_number += 1

while True:
    print("1. Login")
    print("2. Signup")
    print("3. Quit")

    choice = input("Enter your choice: ")

    if choice == "1":
        login()
        break
    elif choice == "2":
        student_signup()
        break
    elif choice == "3":
        break
    else:
        print("Invalid choice. Please try again.")

# Close database connection
db.close()
