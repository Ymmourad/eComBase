DROP SCHEMA IF EXISTS eComBase;
CREATE SCHEMA eComBase;
USE eComBase;

CREATE TABLE BRANCH_INFO 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Street_Address VARCHAR (255) , 
     City CHAR (64) , 
     State CHAR (64) , 
     Zipcode CHAR (50) , 
     Phone_Number VARCHAR (255) , 
     Open_Timing VARCHAR (500) , 
     STORE_SPECIFICATION_Id INTEGER NOT NULL 
    )
;



CREATE TABLE INDUSTRY 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Name CHAR (64) , 
     Discription CHAR (255) 
    )
;
 

CREATE TABLE MANUFACTURES 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Name CHAR (64) , 
     Discription CHAR (255) 
    )
;


CREATE TABLE PRODUCT 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Name CHAR (64) NOT NULL , 
     Type VARCHAR (255) 
    )
;


CREATE TABLE PRODUCT_DETAIL_INFORMATION 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Product_SKU VARCHAR (255) , 
     Market_Price VARCHAR (255) , 
     Retail_Price VARCHAR (255) , 
     Height DECIMAL (4,2) , 
     Weight DECIMAL (6,2) , 
     Width DECIMAL (5,2) , 
     Year_Created DATE , 
     Periodic_Restock BIT , 
     Random_Restock BIT , 
     Refurbised BIT , 
     RarityScaricityAvailability VARCHAR (255) , 
     MANUFACTURES_Id INTEGER NOT NULL , 
     INDUSTRY_Id INTEGER NOT NULL , 
     PRODUCT_Id INTEGER NOT NULL 
    )
;

CREATE TABLE SEARCH_TAGS 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , 
     Name CHAR (64) , 
     GPU VARCHAR (255) , 
     CPU VARCHAR (255) , 
     TCG VARCHAR (255) , 
     Shoe VARCHAR (255) , 
     PRODUCT_Id INTEGER NOT NULL 
    )
;


CREATE TABLE STORE_BUYER_INFORMATION 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Account_Need BIT , 
     One_Per_Household BIT , 
     Accepted_Payment VARCHAR (255) , 
     Return_Policy VARCHAR (255) , 
     Store_Warranty_Availability BIT , 
     Manufacturer_Warranty BIT , 
     PRODUCT_DETAIL_INFORMATION_Id INTEGER NOT NULL 
    )
;



CREATE TABLE STORE_SPECIFICATION 
    (
     Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     Store_Name VARCHAR (64) , 
     Store_Code VARCHAR (64) , 
     Store_Type VARCHAR (64) NOT NULL 
    )
;



ALTER TABLE BRANCH_INFO 
    ADD CONSTRAINT BRANCH_INFO_STORE_SPECIFICATION_FK FOREIGN KEY 
    ( 
     STORE_SPECIFICATION_Id
    ) 
    REFERENCES STORE_SPECIFICATION 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;

ALTER TABLE PRODUCT_DETAIL_INFORMATION 
    ADD CONSTRAINT PRODUCT_DETAIL_INFORMATION_INDUSTRY_FK FOREIGN KEY 
    ( 
     INDUSTRY_Id
    ) 
    REFERENCES INDUSTRY 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;

ALTER TABLE PRODUCT_DETAIL_INFORMATION 
    ADD CONSTRAINT PRODUCT_DETAIL_INFORMATION_MANUFACTURES_FK FOREIGN KEY 
    ( 
     MANUFACTURES_Id
    ) 
    REFERENCES MANUFACTURES 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;

ALTER TABLE PRODUCT_DETAIL_INFORMATION 
    ADD CONSTRAINT PRODUCT_DETAIL_INFORMATION_PRODUCT_FK FOREIGN KEY 
    ( 
     PRODUCT_Id
    ) 
    REFERENCES PRODUCT 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;

ALTER TABLE SEARCH_TAGS 
    ADD CONSTRAINT SEARCH_TAGS_PRODUCT_FK FOREIGN KEY 
    ( 
     PRODUCT_Id
    ) 
    REFERENCES PRODUCT 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;

ALTER TABLE STORE_BUYER_INFORMATION 
    ADD CONSTRAINT STORE_BUYER_INFO_PROD_DETAIL_INFO_FK FOREIGN KEY 
    ( 
     PRODUCT_DETAIL_INFORMATION_Id
    ) 
    REFERENCES PRODUCT_DETAIL_INFORMATION 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
;




-- 
