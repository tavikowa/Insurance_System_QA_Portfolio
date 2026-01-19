import os
import sqlite3
import json

current_dir = os.path.dirname(os.path.abspath(__file__))
json_path = os.path.join(current_dir, '..', '03_API_Test_Data', 'quote_request_jan.json')
db_path = os.path.join(current_dir, 'sql_script.db')

def run_test():
    try:
        with open(json_path, 'r', encoding='utf-8') as file:
            data_json = json.load(file)

            my_client_id = data_json['client_data']['client_id']

            connection = sqlite3.connect(db_path)
            cursor = connection.cursor()

            cursor.execute("SELECT policy_fee FROM policies WHERE client_id = ?", (my_client_id,))

            result = cursor.fetchone()
            connection.close()

            print(f"Policy fee from DB for client ID {my_client_id}: {result[0] if result else 'No policy found'}")

        if result:
            actual_price = result[0]
            expected_price = 1200.00  # Expected price for exprienced driver

            if actual_price == expected_price:
                print("Test Passed: Pricing rule applied correctly.")
            else:
                print(f"Test Failed: Expected {expected_price}, but got {actual_price}.")
        else:
            print("No result found for this client.")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    run_test()