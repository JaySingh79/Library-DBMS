import mysql.connector
from prettytable import PrettyTable

# Connect to the database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MySQl1234.",
    database="library"
)

# Function to display table data
def display_table(table_name, limit=10):
    cursor = conn.cursor()
    query = f"SELECT * FROM {table_name} LIMIT {limit}"
    cursor.execute(query)
    rows = cursor.fetchall()

    # Create a pretty table
    table = PrettyTable()
    table.field_names = cursor.column_names
    table.add_rows(rows)

    # Print the table
    print(table)

    cursor.close()

# Function to display options
def display_options():
    print("\nOptions:")
    print("1. View Students")
    print("2. View Books")
    print("3. View Borrowings")
    print("4. View Reservations")
    print("5. Exit")

# Main program loop
while True:
    # Display options
    display_options()
    choice = input("Enter your choice: ")

    if choice == "1":
        # View Students
        display_table("users")
    elif choice == "2":
        # View Books
        display_table("books", limit=10)
    elif choice == "3":
        # View Borrowings
        display_table("borrowings")
    elif choice == "4":
        # View Reservations
        display_table("reservations")
    elif choice == "5":
        # Exit the program
        break
    else:
        print("Invalid choice. Please try again.")

# Close the database connection
conn.close()
