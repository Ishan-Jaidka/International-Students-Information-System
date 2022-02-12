# International Student Information System

## Ishan Jaidka & Duncan Garing

<br><br>

## Description:

This application interfaces with a database we designed that stores information about international students, both current and graduated. The application connects to the database after prompting the user for login info, then it allows users to access details stored in the database with preconfigured queries. The update function requires an additional login, username (admin) and password (admin), and it allows users to update or delete certain details stored in the database.

<br><br>

## Architecture:

The database is hosted on AWS RDS, and the frontend uses JDBC to create a MySQL connection to the endpoint. In the future, there will be a website that provides a cleaner and easier user interface.

<br><br>

## Data:

All CREATE and INSERT statements for the tables and test data are included in: 
```
.\MySQL
```


<br><br>

## Application Login Information:

| Access | Username | Password |
| --- | --- | --- |
| *Login* | student | password |
| *Update* | admin | admin |

<br><br>

## Here is our original [App Demo Video](https://youtu.be/0sxtlQhBy0A)