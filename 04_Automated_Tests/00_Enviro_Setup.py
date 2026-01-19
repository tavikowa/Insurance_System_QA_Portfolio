import sqlite3
import os

current_dir = os.path.dirname(os.path.abspath(__file__))   #current dir location
sql_path = os.path.join(current_dir, '..', '02_SQL_Data_Validation', '01_Insurance_DB.sql') #path to the sql file
db_path = os.path.join(current_dir, 'sql_script.db')  #path to the new database file

def setup_database():
    print("Setting up the database...")

    with open(sql_path, 'r', encoding='utf-8') as file:
        sql_script = file.read()    #sql_script becomes 'nickname" for 01_Insurance_DB.sql file

    if os.path.exists(db_path):
        os.remove(db_path)   #removes existing db file if exists
        print("Old database removed, setting up a new one...")
    else:
        print("Setting up a new database...")

    connection = sqlite3.connect(db_path)
    cursor = connection.cursor()

    try:
        cursor.executescript(sql_script)   #executes the sql script
        connection.commit()
        print("Database setup completed successfully.")
    except sqlite3.Error as e:
        print(f"An error occurred: {e}")
    finally:
        # Verify that the data has been inserted correctly
        print("\n Making sure data is saved properly... \n")

        cursor.execute("SELECT first_name, last_name, pesel FROM clients WHERE client_id = 4")
        client = cursor.fetchone()

        if client:
            print(f"Client ID 4: {client[0]} {client[1]}, PESEL: {client[2]}")
        else:
            print("Client ID 4 not found.")

        cursor.execute("SELECT count(*) FROM policies")
        policies_number = cursor.fetchone()[0]
        print(f"Total number of policies: {policies_number}")
        # end verification
        
        connection.close()


if __name__ == "__main__":
    setup_database()