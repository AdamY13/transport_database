#include <stdlib.h>
#include <iostream>
#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

using namespace std;

int main(void)
{
    cout << endl;

    try {
        sql::Driver* driver;
        sql::Connection* con;
        sql::Statement* stmt;
        sql::ResultSet* res;
        /* Create a connection */
        driver = get_driver_instance();
        con = driver->connect("tcp://127.0.0.1:3306", "root", "qwerty123");
        /* Connect to the MySQL test database */
        con->setSchema("publictransport");


        string area;
        cout << "Enter an area name: ";
        cin >> area;

        stmt = con->createStatement();


        res = stmt->executeQuery("SELECT DISTINCT RouteName, Start, End  FROM bus_stop , route , has  WHERE RID = RouteID AND StopName = SName AND area LIKE  '%" + area + "%' ");

        while (res->next()) {
            cout << endl;
            cout << "Route name: ";
            cout << res->getString("RouteName") << endl;
            cout << "Start terminal: ";
            cout << res->getString("Start") << endl;
            cout << "End terminal: ";
            cout << res->getString("End") << endl;
            cout << endl;
        }
        delete res;
        delete stmt;
        delete con;

    }
    catch (sql::SQLException& e) {
        cout << "# ERR: SQLException in " <<__FILE__;
        cout << "# ERR: " << e.what();
        cout << " (MySQL error code: " << e.getErrorCode();
        cout << ", SQLState: " << e.getSQLState() << " )" << endl;
    }

    cout << endl;

    return EXIT_SUCCESS;
}
