# Barbershop Database

This is a rudimentary database management system for a barber shop that can't afford a Wix.com 
subscription. In it you will find functionality for logging in, registering for a customer account,
managing your appointments (if you are a customer), viewing your appointments and managing your 
sales (if you are an employee), and viewing all barbers, services, and products offered in the shop
for those without an account. 
There is additional functionality in the back-end, including hiring customers to be employees, 
giving raises to employees, firing employees, etc. These however, are not accessible via the 
front-end application because of the requirement for a third type of user - an admin, and the 
limited amount of time we had to work with. 

## Getting Started

To run this database tool, you will need a running version of the `hairsalon` MySQL database, which
is included as a SQL create script in the project folder, and a way to run the python file (either 
via command-line or through an IDE like PyCharm - linked below). All the files can be kept in the
same folder, since this is a one-script implementation, there is no specific directory arrangement 
required.

### Prerequisites

What things you need to run the program:
* MySQL 8.0 or higher
* Python 3.5 or higher, we used 3.7
* SQLAlchemy (installed with PyPI, pip)
* PyCharm and MySQL Workbench

Grab the latest versions of these from the website linked in 'Built With'

## Deployment

To deploy this on a live system, simply install the required software, run the included 
`hairsalon.sql` file to create the database using MySQLWorkbench and the localhost, and then run 
`barber_db.py` with command-line prompts or with a configuration in an IDE like PyCharm. 
`barber_db.py` will attempt to install `SQLAlchemy` using `pip`, and will throw an exception if 
that requirement is not filled. Then simply follow the on-screen instructions in the app. For the
extended administrator functionality, use MySQL Workbench to run the `hire_employee`, 
`fire_employee`, or `set_salary` procedures to do their associated tasks. 

## Built With

* [MySQL](https://www.mysql.com/) - The relational database back-end
* [SQLAlchemy](https://www.sqlalchemy.org/) - The interface between our python code and the 
database
* [Python](https://www.python.org) - Python for running the front-end
* [PyCharm](https://www.jetbrains.com/pycharm/) - The IDE used to write this python application
* [MySQL Workbench](https://www.mysql.com/products/workbench/) - The GUI used to define the 
database structure, and to write its functions and procedures

## Authors

* **Allen Shen** - *Scraping data, coding, and stuff*
* **Aaditya Watwe** - *Database design, coding, and stuff*

## Acknowledgments

* Hat tip to the TAs for coming in clutch
* Remember to never trust your IDE's autofill to find functions for you
