import subprocess
import sys


def install(package):
    subprocess.call([sys.executable, "-m", "pip", "install", package])


install("sqlalchemy")

import sqlalchemy
from sqlalchemy.exc import OperationalError

# Save the configuration as the following variable
settings = {
    'userName': "root",  # The name of the MySQL account to use (or empty for anonymous)
    'password': "root",  # The password for the MySQL account (or empty for anonymous)
    'serverName': "localhost",  # The name of the computer running MySQL
    'portNumber': '3306',  # The port of the MySQL server (default is 3306)
    'dbName': "hairsalon",  # The name of the database we are testing with (this default is installed with MySQL)
}

# Catch any errors connecting to MySQL with the engine
try:
    engine = sqlalchemy.create_engine(
        'mysql://{0[userName]}:{0[password]}@{0[serverName]}:{0[portNumber]}/{0[dbName]}'.format(settings))
    connection = engine.connect()
    print("Connected to database" + engine.__str__())
except OperationalError:
    print("OperationalError: Unable to connect to MySQL database.")


# A helper to run the execute command return the result array, or an empty array in the even of a failure
def engine_execute(query):
    try:
        query = engine.execute(query)
    except Exception:
        print("There was an error retrieving the data.")
        query = []
    return query


# A helper to start a transaction, run the execute command and commit the query, then return the query result
def begin_and_commit(query):
    trans = connection.begin()
    try:
        query = connection.execute(query)
    except Exception:
        query = []
    try:
        trans.commit()
    except Exception:
        trans.rollback()
    return query


# A helper function that turns a TINYINT result into a Python bool
def function_to_boolean(sql_function_query):
    try:
        x = begin_and_commit(sql_function_query)
        for row in x:
            for col in row:
                return col == 1
    except Exception:
        return False


def end_db():
    engine.dispose()
    raise SystemExit(0)


def login_screen():
    print("\n")
    print("Log in to your account")
    email = input("Email: ")
    password = input("Password: ")
    login_query = "SELECT valid_login('" + email + "', '" + password + "')"
    successful_login = function_to_boolean(login_query)
    if successful_login:
        valid_employee_query = "SELECT valid_employee('" + email + "')"
        valid_employee = function_to_boolean(valid_employee_query)
        if valid_employee:
            employee_screen(email)
        else:
            customer_screen(email)
    else:
        print("Incorrect email or password.\nPress [1] to try again.\nPress [0] to return to welcome screen.")
        choice = input("Input: ")
        if choice == "1":
            login_screen()
        if choice == "0":
            welcome_screen()
        else:
            print("Invalid input. Returning to welcome screen.")
            welcome_screen()
    print("\n")


def register_screen():
    print("\n")
    print("Register for a new account")
    username = input("Username: ")
    first_name = input("First Name: ")
    last_name = input("Last Name: ")
    email = input("Email: ")
    password = input("Password: ")
    confirm_pass = input("Confirm Password: ")

    while password != confirm_pass:
        print("The passwords did not match. Please re-enter your password.")
        password = input("Password: ")
        confirm_pass = input("Confirm Password: ")

    register_query = "SELECT valid_register('" + email + "', '" + username + "', '" + password + "', '" + \
                     first_name + "', '" + last_name + "')"
    successful_register = function_to_boolean(register_query)
    if successful_register:
        print("Successfully registered!\n")
        login_screen()
    else:
        print("The registration failed.\nPress [1] to try again.\nPress [0] to return to welcome screen.")
        choice = input("Input: ")
        if choice == "1":
            register_screen()
        if choice == "0":
            welcome_screen()
        else:
            print("Invalid input. Returning to welcome screen.")
            welcome_screen()
    print("\n")


def add_appointment(email):
    print("\n")
    print("Your Appointments: ")
    cust_query = "CALL retrieve_cust_appointments('" + email + "')"
    cust_appointments = engine_execute(cust_query)
    for appointment in cust_appointments:
        print(appointment[0], " at ", appointment[1], " - ", appointment[3], " with ", appointment[2])
    print("\n")
    print("Please follow the prompts to add an appointment.")
    print("\n")

    app_yr = input("Year (in YYYY form): ")
    app_month = input("Month (in MM form): ")
    app_day = input("Day (in DD form): ")
    app_date = app_yr + "-" + app_month + "-" + app_day

    app_time = input("Time (in HH:MM:SS military-time form): ")

    print("\n")
    specify_serv = input("Specify service? [Y] for yes, [ANY OTHER KEY] for no: ")
    if specify_serv == "Y":
        print("\n")
        print("Select a service ID from the following list.")
        print("\n")
        services = engine_execute("CALL retrieve_services()")
        print("\n")
        print("Here are our services, their IDs, and their prices:")
        for entry in services:
            print("ID: ", entry[0], " || ", entry[1], " - $", entry[2])
        print("\n")
        serv = input("Service ID: ")
    else:
        serv = "1"

    print("\n")
    print("Select an email from the following list.")
    print("\n")
    barbers = engine_execute("CALL retrieve_employees()")
    print("\n")
    print("Here are our barbers, their specialties, and emails:")
    for entry in barbers:
        print(entry[0], " - ", entry[1], " || email: ", entry[2])
    print("\n")
    barber = input("Barber email: ")

    add_appointment_query = "SELECT valid_appointment('" + app_date + "', '" + app_time + "', '" + \
                            email + "', '" + serv + "', '" + barber + "')"
    success = function_to_boolean(add_appointment_query)
    if success:
        print("\n")
        print("Appointment added!")
        print("\n")
        customer_screen(email)
    else:
        print("\n")
        print("Add failed!")
        print("\n")
        customer_screen(email)
    print("\n")


def delete_appointment(email):
    print("\n")
    print("Your Appointments: ")
    cust_query = "CALL retrieve_cust_appointments('" + email + "')"
    cust_appointments = engine_execute(cust_query)
    for appointment in cust_appointments:
        print(appointment[0], " at ", appointment[1], " - ", appointment[3], " with ", appointment[2])
    print("\n")
    print("Please follow the prompts to delete an appointment.")
    print("\n")
    print("Enter the details of which appointment you wish to delete.")
    print("\n")

    app_yr = input("Year (in YYYY form): ")
    app_month = input("Month (in MM form): ")
    app_day = input("Day (in DD form): ")
    app_date = app_yr + "-" + app_month + "-" + app_day

    app_time = input("Time (in HH:MM:SS military-time form): ")

    delete_appointment_query = "SELECT delete_appointment('" + app_date + "', '" + \
                               app_time + "', '" + email + "')"
    success = function_to_boolean(delete_appointment_query)
    if success:
        print("\n")
        print("Appointment deleted!")
        print("\n")
        customer_screen(email)
    else:
        print("\n")
        print("Delete failed!")
        print("\n")
        customer_screen(email)
    print("\n")


def customer_screen(email):
    name_query = "SELECT retrieve_name('" + email + "')"
    customer_name_result = begin_and_commit(name_query)
    customer_name = "NAME NOT RETRIEVED"
    for row in customer_name_result:
        for name in row:
            customer_name = name
    print("Customer: " + customer_name)
    print("Press [1] to view your appointments.\nPress [2] to add an appointment.\n"
          "Press [3] to delete an appointment.\n"
          "Press [ANY OTHER KEY] to log-out and return to the welcome screen.")
    choice = input("Input: ")
    if choice == "1":
        view_appointments(email)
    if choice == "2":
        add_appointment(email)
    if choice == "3":
        delete_appointment(email)
    else:
        welcome_screen()
    print("\n")


def view_sales(email):
    sales_query = engine_execute("CALL retrieve_sales('" + email + "')")
    print("\n")
    print("Here are your sales, their numbers, the names and emails of the customers,\n"
          "and the names and IDs of the items sold:")
    print("\n")
    for sale in sales_query:
        print("Num. ", str(sale[0]), " || ",
              str(sale[1]), " [Email: ", str(sale[2]), "] purchased ",
              str(sale[3]), " [ID: " + str(sale[4]) + "]")
    print("\nPress [1] to return to your account screen.\n"
          "Press [ANY OTHER KEY] to log-out and return to the welcome screen.")
    choice = input("Input: ")
    if choice == "1":
        employee_screen(email)
    else:
        welcome_screen()
    print("\n")


def make_sale(email):
    print("\n")
    print("Follow the prompts to make a new sale.")
    print("\n")

    print("\nPlease enter the email of the customer")
    customer = input("Customer: ")

    print("\nPlease enter the ID of the service or product that was bought")
    item_sold = input("Item ID: ")

    make_sale_query = "SELECT valid_sale('" + email + "', '" + customer + "', '" + item_sold + "')"
    success = function_to_boolean(make_sale_query)
    print("\n")
    if success:
        print("\nSale was registered!")
        print("\nReturning to account screen")
        employee_screen(email)
    else:
        print("\nSale not registered!")
        print("\nTry again?")
        print("\nPress [1] to try again.\nPress [ANY OTHER KEY] to return to the account screen.")
        choice = input("Input: ")
        if choice == "1":
            make_sale(email)
        else:
            employee_screen(email)
    print("\n")


def update_sale(email):
    sales_query = engine_execute("CALL retrieve_sales('" + email + "')")
    print("\n")
    print("Here are your sales, their numbers, the names and emails of the customers,\n"
          "and the names and IDs of the items sold:")
    print("\n")
    for sale in sales_query:
        print("Num. ", str(sale[0]), " || ",
              str(sale[1]), " [Email: ", str(sale[2]), "] purchased ",
              str(sale[3]), " [ID: " + str(sale[4]) + "]")
    print("\n")
    print("Follow the prompts to make a update a sale.")
    print("\n")

    print("Choose the ID of the sale you want to update")
    sale_id = input("Sale ID: ")

    print("Please enter the email of the customer")
    customer = input("Updated Customer Email: ")

    print("Please enter the ID of the service or product that was bought")
    item_sold = input("Updated Item ID: ")

    update_sale_query = "SELECT valid_update_sale('" + str(sale_id) + "', '" + email + "', '" + \
                        customer + "', '" + str(item_sold) + "')"
    success = function_to_boolean(update_sale_query)
    print("\n")
    if success:
        print("Sale was updated!")
        print("Returning to account screen")
        employee_screen(email)
    else:
        print("Sale not updated!")
        print("Try again?")
        print("Press [1] to try again.\nPress [ANY OTHER KEY] to return to the account screen.")
        choice = input("Input: ")
        if choice == "1":
            update_sale(email)
        else:
            employee_screen(email)
    print("\n")


def delete_sale(email):
    sales_query = engine_execute("CALL retrieve_sales('" + email + "')")
    print("\n")
    print("Here are your sales, their numbers, the names and emails of the customers,\n"
          "and the names and IDs of the items sold:")
    print("\n")
    for sale in sales_query:
        print("Num. ", str(sale[0]), " || ",
              str(sale[1]), " [Email: ", str(sale[2]), "] purchased ",
              str(sale[3]), " [ID: " + str(sale[4]) + "]")
    print("\n")
    print("Choose the ID of the sale you want to delete")
    sale_id = input("Sale ID: ")

    delete_sale_query = "SELECT valid_delete_sale('" + str(sale_id) + "', '" + email + "')"
    success = function_to_boolean(delete_sale_query)
    print("\n")
    if success:
        print("Sale was deleted!")
        print("Returning to account screen")
        employee_screen(email)
    else:
        print("Sale not deleted!")
        print("Try again?")
        print("Press [1] to try again.\nPress [ANY OTHER KEY] to return to the account screen.")
        choice = input("Input: ")
        if choice == "1":
            delete_sale(email)
        else:
            employee_screen(email)
    print("\n")


def change_specialty(email):
    specialties_query = engine_execute("CALL retrieve_services()")
    print("\n")
    print("Here are your choices in specialties:")
    print("\n")
    for entry in specialties_query:
        print("ID: ", entry[0], " || ", entry[1])
    print("\n")
    print("Press [ID Value] to make that service your new specialty.\n"
          "Press [R] to return to your account screen.")
    choice = input("Input: ")
    if choice.lower() == "r":
        employee_screen(email)
    try:
        choice_as_int = int(choice)
    except ValueError:
        choice_as_int = -1
        print("Invalid input. Returning to account screen.\n")
        employee_screen(email)
    change_specialty_query = "SELECT change_specialty('" + email + "', " + str(choice_as_int) + ")"
    success = function_to_boolean(change_specialty_query)
    if success:
        print("Successfully changed!\n")
        employee_screen(email)
    else:
        print("Failed to change!\n")
        employee_screen(email)
    print("\n")


def employee_screen(email):
    name_query = "SELECT retrieve_name('" + email + "')"
    customer_name_result = begin_and_commit(name_query)
    employee_name = "NAME NOT RETRIEVED"
    for row in customer_name_result:
        for name in row:
            employee_name = name
    print("Employee: " + employee_name)
    print("Press [1] to view your appointments.\n"
          "Press [2] to view your past sales.\nPress [3] to make a new sale.\n"
          "Press [4] to update a sale.\nPress [5] to delete a sale.\n"
          "Press [6] to change your specialty.\n"
          "Press [ANY OTHER KEY] to log-out and return to the welcome screen.")
    choice = input("Input: ")
    if choice == "1":
        view_appointments(email)
    if choice == "2":
        view_sales(email)
    if choice == "3":
        make_sale(email)
    if choice == "4":
        update_sale(email)
    if choice == "5":
        delete_sale(email)
    if choice == "6":
        change_specialty(email)
    else:
        welcome_screen()
    print("\n")


def view_appointments(email):
    valid_employee_query = "SELECT valid_employee('" + email + "')"
    valid_employee = function_to_boolean(valid_employee_query)
    print("Your Appointments: ")
    if valid_employee:
        empl_query = "CALL retrieve_empl_appointments('" + email + "')"
        empl_appointments = engine_execute(empl_query)
        for appointment in empl_appointments:
            date = appointment[0]
            time = appointment[1]
            customer = appointment[2]
            service = appointment[3]
            print(date, " at ", time, " - ", service, " for ", customer)
        print("\nPress [1] to return to your account screen.\n"
              "Press [ANY OTHER KEY] to log-out and return to the welcome screen.")
        choice = input("Input: ")
        if choice == "1":
            employee_screen(email)
        else:
            welcome_screen()
    else:
        cust_query = "CALL retrieve_cust_appointments('" + email + "')"
        cust_appointments = engine_execute(cust_query)
        for appointment in cust_appointments:
            date = appointment[0]
            time = appointment[1]
            barber = appointment[2]
            service = appointment[3]
            print(date, " at ", time, " - ", service, " with ", barber)
        print("\nPress [1] to return to your account screen.\n"
              "Press [ANY OTHER KEY] to log-out and return to the welcome screen.")
        choice = input("Input: ")
        if choice == "1":
            customer_screen(email)
        else:
            welcome_screen()
    print("\n")


def show_barbers_welcome():
    x = engine_execute("CALL retrieve_employees()")
    print("\n")
    print("Here are our barbers, their specialties, and emails:")
    for entry in x:
        print(entry[0], " - ", entry[1], " || email: ", entry[2])
    print("\n")
    print("Press [1] to return to the welcome screen.\nPress [ANY OTHER KEY] to exit.")
    choice = input("Input: ")
    if choice == "1":
        welcome_screen()
    else:
        end_db()
    print("\n")


def show_services_welcome():
    x = engine_execute("CALL retrieve_services()")
    print("\n")
    print("Here are our services, their IDs, and their prices:")
    for entry in x:
        print("ID: ", entry[0], " || ", entry[1], " - $", entry[2])
    print("\n")
    print("Press [1] to return to the welcome screen.\nPress [ANY OTHER KEY] to exit.")
    choice = input("Input: ")
    if choice == "1":
        welcome_screen()
    else:
        end_db()
    print("\n")


def show_products_welcome():
    x = engine_execute("CALL retrieve_products()")
    print("\n")
    print("Here are our products, their IDs, and their prices:")
    for entry in x:
        print("ID: ", entry[0], " || ", entry[1], " - $", entry[2])
    print("\n")
    print("Press [1] to return to the welcome screen.\nPress [ANY OTHER KEY] to exit.")
    choice = input("Input: ")
    if choice == "1":
        welcome_screen()
    else:
        end_db()
    print("\n")


def welcome_screen():
    print('--------------------------------------------------------------------------------------')
    print('---------------------------------', "Welcome to HairDB!", '---------------------------------')
    print('--------------------------------------------------------------------------------------\n')
    print('Hair Cutters Co. is located on 123 Maple Street, Boston, MA\nWe are open 10 to 7, weekdays only!\n')
    print("Press [1] to Log In\nPress [2] to Register\nPress [3] to see our barbers\n"
          "Press [4] to see our services\nPress [5] to see our products\nPress [ANY OTHER KEY] to exit.")
    choice = input("Input: ")
    if choice == "1":
        login_screen()
    if choice == "2":
        register_screen()
    if choice == "3":
        show_barbers_welcome()
    if choice == "4":
        show_services_welcome()
    if choice == "5":
        show_products_welcome()
    else:
        end_db()
    print("\n")


welcome_screen()
