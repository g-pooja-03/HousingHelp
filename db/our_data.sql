CREATE DATABASE housing_finder;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON housing_finder.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE housing_finder;

CREATE TABLE Price_Code (
    price_id VARCHAR(2) PRIMARY KEY,
    price_category VARCHAR(3) CHECK (price_category IN ('low', 'med', 'hi')),
    price VARCHAR(6)
);

insert into Price_Code (price_id, price_category, price) values (1, 'low', 700);
insert into Price_Code (price_id, price_category, price) values (2, 'low', 800);
insert into Price_Code (price_id, price_category, price) values (3, 'low', 900);
insert into Price_Code (price_id, price_category, price) values (4, 'low', 1000);
insert into Price_Code (price_id, price_category, price) values (5, 'med', 1100);
insert into Price_Code (price_id, price_category, price) values (6, 'med', 1200);
insert into Price_Code (price_id, price_category, price) values (7, 'med', 1300);
insert into Price_Code (price_id, price_category, price) values (8, 'med', 1400);
insert into Price_Code (price_id, price_category, price) values (9, 'med', 1500);
insert into Price_Code (price_id, price_category, price) values (10, 'hi', 1600);
insert into Price_Code (price_id, price_category, price) values (11, 'hi', 1700);
insert into Price_Code (price_id, price_category, price) values (12, 'hi', 1800);
insert into Price_Code (price_id, price_category, price) values (13, 'hi', 1900);
insert into Price_Code (price_id, price_category, price) values (14, 'hi', 2000);
insert into Price_Code (price_id, price_category, price) values (15, 'hi', 2100);
insert into Price_Code (price_id, price_category, price) values (16, 'hi', 2200);
insert into Price_Code (price_id, price_category, price) values (17, 'hi', 2300);
insert into Price_Code (price_id, price_category, price) values (18, 'hi', 2400);
insert into Price_Code (price_id, price_category, price) values (19, 'hi', 2500);
insert into Price_Code (price_id, price_category, price) values (20, 'hi', 2600);
insert into Price_Code (price_id, price_category, price) values (21, 'hi', 2700);
insert into Price_Code (price_id, price_category, price) values (22, 'hi', 2800);
insert into Price_Code (price_id, price_category, price) values (23, 'hi', 2900);
insert into Price_Code (price_id, price_category, price) values (24, 'hi', 3000);


CREATE TABLE Roommate_Pref (
    pref_id VARCHAR(2) PRIMARY KEY,
    preference_type VARCHAR(4) CHECK (preference_type IN ('low', 'med', 'str')),
    smoking BOOLEAN,
    pets BOOLEAN
    );

insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (1, 'low', false, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (2, 'low', false, true);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (3, 'low', true, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (4, 'low', true, true);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (5, 'med', false, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (6, 'med', false, true);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (7, 'med', true, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (8, 'med', true, true);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (9, 'str', false, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (10, 'str', false, true);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (11, 'str', true, false);
insert into Roommate_Pref (pref_id, preference_type, smoking, pets) values (12, 'str', true, true);

CREATE TABLE Building (
    building_id VARCHAR(9) PRIMARY KEY,
    building_type_id VARCHAR(3),
    building_address VARCHAR(30),
    building_name VARCHAR(20),
    minimum_age VARCHAR(2),
    monthly_rent VARCHAR(6),
    available_bedspaces VARCHAR(1),
    price_id VARCHAR(2),
    CONSTRAINT fk_0 FOREIGN KEY (price_id)
        REFERENCES Price_Code (price_id)
);

insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (12889967, 158, '1 International Crossing', 'Steensland', 7, 1300, 7, 7);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (291537331, 1, '5 Elka Center', 'Troy', 7, 700, 4, 1);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (540296785, 141, '389 Service Hill', 'Manufacturers', 10, 1900, 7, 13);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (590665407, 119, '320 Washington Lane', 'Chive', 0, 1400, 6, 8);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (783009091, 611, '7 Barnett Place', 'Gina', 6, 1500, 5, 9);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (887875152, 287, '6 Mallory Park', 'Dahle', 2, 2000, 7, 14);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (598159342, 954, '1 Hollow Ridge Drive', 'Nova', 11, 3000, 4, 24);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (752921140, 823, '9070 Butterfield Crossing', 'Ronald Regan', 1, 1900, 4, 23);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (845369539, 138, '41926 Mcguire Junction', 'Waywood', 1, 1000, 5, 4);
insert into Building (building_id, building_type_id, building_address, building_name, minimum_age, monthly_rent,
                  available_bedspaces, price_id) values (75823558, 119, '6 Del Sol Plaza', 'Dexter', 13, 1200, 7, 6);

CREATE TABLE Unit (
    unit_id VARCHAR(9) PRIMARY KEY,
    bathrooms VARCHAR(1),
    bedrooms VARCHAR(1),
    wifi_included BOOLEAN,
    building_id VARCHAR(9),
    CONSTRAINT fk_1 FOREIGN KEY (building_id)
        REFERENCES Building (building_id)
);

insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (796935159, 5, 3, true, 12889967);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (573342388, 2, 3, false, 291537331);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (655210274, 5, 5, true, 540296785);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (918833953, 7, 1, true, 590665407);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (35060619, 3, 2, true, 783009091);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (152591551, 6, 2, false, 783009091);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (674168310, 6, 8, false, 783009091);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (468129121, 7, 7, true, 752921140);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (880337743, 3, 6, true, 752921140);
insert into Unit (unit_id, bathrooms, bedrooms, wifi_included, building_id) values (221321656, 9, 8, true, 752921140);

CREATE TABLE Student (
    stu_id CHAR(9) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    year_in_school VARCHAR(1),
    age VARCHAR(2) CHECK (age > 16 AND age < 30),
    price_id VARCHAR(2),
    building_id VARCHAR(9),
    pref_id VARCHAR(2),
    CONSTRAINT fk_2 FOREIGN KEY (price_id)
        REFERENCES Price_Code (price_id),
    CONSTRAINT fk_3 FOREIGN KEY (building_id)
        REFERENCES Building (building_id),
    CONSTRAINT fk_4 FOREIGN KEY (pref_id)
        REFERENCES Roommate_Pref (pref_id)
);

insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (429940719, 'Laurie', 'Charon', 2, 20, 1, 12889967, 1);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (476478220, 'Hollis', 'Juleff', 4, 22, 1, 12889967, 2);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (140460899, 'Jordan', 'Kohrt', 6, 18, 1, 12889967, 3);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (762372208, 'Lynna', 'Roskam', 3, 22, 3, 590665407, 4);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (519109740, 'Addy', 'Barthelet', 5, 25, 3, 590665407, 5);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (166175503, 'Joseito', 'Cottu', 5, 23, 3, 590665407, 6);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (766248167, 'Bartolomeo', 'Garci', 5, 17, 3, 752921140, 7);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (580748529, 'Jock', 'Stanners', 6, 18, 10, 752921140, 8);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (868581856, 'Stesha', 'Ordish', 2, 24, 12, 752921140, 9);
insert into Student (stu_id, first_name, last_name, year_in_school, age, price_id, building_id, pref_id)
values (213085665, 'Alie', 'Stener', 5, 25, 11, 752921140, 10);

CREATE TABLE Tenant (
    tenant_id VARCHAR(9) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age VARCHAR(2),
    pref_id VARCHAR(2),
    building_id VARCHAR(9),
    CONSTRAINT fk_5 FOREIGN KEY (pref_id)
        REFERENCES Roommate_Pref (pref_id),
    CONSTRAINT fk_6 FOREIGN KEY (building_id)
        REFERENCES Building (building_id)
);

insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (84250156, 'Siouxie', 'Swinyard', 23, 1, 887875152);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (199123351, 'Melisse', 'Sertin', 22, 2, 887875152);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (116129084, 'Mirna', 'Han', 25, 3, 887875152);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (911447170, 'Amandie', 'Bacup', 21, 4, 887875152);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (45794122, 'Isobel', 'Royste', 19, 5, 752921140);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (787072034, 'Truman', 'Pacher', 20, 6, 752921140);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (412357540, 'Addy', 'Ramsier', 15, 7, 752921140);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (245464137, 'Brewster', 'De Ruggiero', 20, 8, 590665407);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (115218578, 'Arni', 'Perello', 16, 9, 590665407);
insert into Tenant (tenant_id, first_name, last_name, age, pref_id, building_id)
values (652610350, 'Tamara', 'Kissack', 25, 10, 590665407);

CREATE TABLE Landlord (
    landlord_id VARCHAR(9) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    building_id VARCHAR(9),
    CONSTRAINT fk_7 FOREIGN KEY (building_id)
        REFERENCES Building (building_id)
);

insert into Landlord (landlord_id, first_name, last_name, building_id) values (10050792, 'Dorella', 'Gauchier', 291537331);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (242161157, 'Galven', 'Brown', 291537331);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (140016497, 'Persis', 'Tamlett', 291537331);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (375259901, 'Daven', 'Vyel', 291537331);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (977204303, 'Merilee', 'Toulamain', 845369539);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (770249814, 'Isobel', 'Suttie', 845369539);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (853050726, 'Germain', 'Raeside', 590665407);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (733042529, 'Shirlene', 'Martschke', 590665407);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (884108775, 'Nance', 'Chaffer', 783009091);
insert into Landlord (landlord_id, first_name, last_name, building_id) values (324227547, 'Tonie', 'Ahmad', 783009091);

CREATE TABLE Building_Tenant (
    tenant_id VARCHAR(9),
    building_id VARCHAR(9),
    current BOOLEAN,
    CONSTRAINT fk_8 FOREIGN KEY (building_id)
        REFERENCES Building (building_id),
    CONSTRAINT fk_9 FOREIGN KEY (tenant_id)
        REFERENCES Tenant (tenant_id)
);

insert into Building_Tenant (tenant_id, building_id, current) values (84250156, 12889967, false);
insert into Building_Tenant (tenant_id, building_id, current) values (84250156, 590665407, false);
insert into Building_Tenant (tenant_id, building_id, current) values (84250156, 887875152, true);
insert into Building_Tenant (tenant_id, building_id, current) values (911447170, 12889967, true);
insert into Building_Tenant (tenant_id, building_id, current) values (911447170, 590665407, false);
insert into Building_Tenant (tenant_id, building_id, current) values (911447170, 887875152, false);
insert into Building_Tenant (tenant_id, building_id, current) values (911447170, 752921140, false);
insert into Building_Tenant (tenant_id, building_id, current) values (652610350, 12889967, false);
insert into Building_Tenant (tenant_id, building_id, current) values (652610350, 590665407, false);
insert into Building_Tenant (tenant_id, building_id, current) values (652610350, 887875152, true);

SHOW TABLES;
