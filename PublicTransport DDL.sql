CREATE DATABASE publictransport;

CREATE TABLE BUS_STOP
( StopName        VARCHAR(30) NOT NULL,
  Area            VARCHAR(30) NOT NULL,
PRIMARY KEY   (StopName));

CREATE TABLE ROUTE
( RouteID           CHAR(5)       NOT NULL,
  RouteName         VARCHAR(30)      NOT NULL,
  Start             VARCHAR(30)      NOT NULL,
  End               VARCHAR(30)      NOT NULL,
  NoOfStops         INT(2)           NOT NULL,
PRIMARY KEY (RouteID),
UNIQUE      (RouteName),
FOREIGN KEY (Start) REFERENCES BUS_STOP(StopName),
FOREIGN KEY (End) REFERENCES BUS_STOP(StopName) );

CREATE TABLE BUS
( License_Plate_Number    VARCHAR(6)       NOT NULL,
  SeatCapacity            DECIMAL(2)      NOT NULL,
  Model                   VARCHAR(20)      NOT NULL,
  ModelYear               DECIMAL(4)      NOT NULL,
  Make                    VARCHAR(20)      NOT NULL,
  FuelType                VARCHAR(10)      CHECK (FuelType IN ('Petrol', 'Diesel', 'Hybrid', 'Electric')),
  R_ID                    CHAR(5)          NOT NULL,
PRIMARY KEY (License_Plate_Number),
FOREIGN KEY (R_ID) REFERENCES ROUTE(RouteID));

CREATE TABLE DRIVER
( Fname           VARCHAR(20)   NOT NULL,
  Lname           VARCHAR(20)      NOT NULL,
  DriverID             CHAR(9)          NOT NULL,
  DriverPhoneNo          DECIMAL(10),
  LPN                  VARCHAR(6)       NOT NULL,
PRIMARY KEY   (DriverID),
FOREIGN KEY   (LPN)  REFERENCES BUS(License_Plate_Number));

CREATE TABLE PASSENGER
( Fname           VARCHAR(20)   NOT NULL,
  Lname           VARCHAR(20)      NOT NULL,
  PassengerID             CHAR(9)          NOT NULL,
  PassPhoneNo          DECIMAL(10),
  LPNO                  VARCHAR(6)       NOT NULL,
PRIMARY KEY   (PassengerID),
FOREIGN KEY   (LPNO)  REFERENCES BUS(License_Plate_Number));


CREATE TABLE HAS
( RID          CHAR(5)   NOT NULL,
  SName          VARCHAR(30)      NOT NULL,
  StopOrder      INT(2)           NOT NULL,
PRIMARY KEY (RID,SName),
FOREIGN KEY (RID) REFERENCES ROUTE(RouteID),
FOREIGN KEY (SName) REFERENCES BUS_STOP(StopName) );