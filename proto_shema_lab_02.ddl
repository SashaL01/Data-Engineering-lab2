-- Generated by Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   at:        2025-02-25 20:24:20 MSK
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE orders 
    ( 
     row_id             INTEGER  NOT NULL , 
     order_id           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                     NOT NULL , 
     order_date         DATE , 
     ship_date          DATE , 
     ship_mode          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     customer_id        VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     customer_name      VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     segment            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     country            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     city               VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     state              VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     postal_code        INTEGER , 
     region             VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     product_id         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     category           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     sub_category       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     product_name       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                    , 
     sales              FLOAT , 
     quantity           INTEGER , 
     discount           FLOAT , 
     profit             FLOAT , 
     returns_returns_ID NUMBER  NOT NULL , 
     "date"             DATE , 
     people_people_ID   NUMBER  NOT NULL , 
     date1              DATE 
    ) 
;

ALTER TABLE orders 
    ADD CONSTRAINT orders_PK PRIMARY KEY ( row_id ) ;

CREATE TABLE people 
    ( 
     person    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                     NOT NULL , 
     region    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                     NOT NULL , 
     people_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE people 
    ADD CONSTRAINT people_PK PRIMARY KEY ( people_ID ) ;

CREATE TABLE returns 
    ( 
     order_id   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
                     NOT NULL , 
     returned   CHAR (1)  NOT NULL , 
     returns_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE returns 
    ADD CONSTRAINT returns_PK PRIMARY KEY ( returns_ID ) ;

ALTER TABLE orders 
    ADD CONSTRAINT orders_people_FK FOREIGN KEY 
    ( 
     people_people_ID
    ) 
    REFERENCES people 
    ( 
     people_ID
    ) 
;

ALTER TABLE orders 
    ADD CONSTRAINT orders_returns_FK FOREIGN KEY 
    ( 
     returns_returns_ID
    ) 
    REFERENCES returns 
    ( 
     returns_ID
    ) 
;

CREATE SEQUENCE people_people_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER people_people_ID_TRG 
BEFORE INSERT ON people 
FOR EACH ROW 
WHEN (NEW.people_ID IS NULL) 
BEGIN 
    :NEW.people_ID := people_people_ID_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE returns_returns_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER returns_returns_ID_TRG 
BEFORE INSERT ON returns 
FOR EACH ROW 
WHEN (NEW.returns_ID IS NULL) 
BEGIN 
    :NEW.returns_ID := returns_returns_ID_SEQ.NEXTVAL; 
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  16
-- WARNINGS                                 0
