
CREATE DATABASE HR;
USE hr;

/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
CREATE TABLE regions (
	region_id INT (11) UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);

CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT (11) UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);


CREATE TABLE locations (
	location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);

CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);

CREATE TABLE jobs (
	job_id VARCHAR(10) NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary DECIMAL(8, 0) UNSIGNED,
	max_salary DECIMAL(8, 0) UNSIGNED,
	PRIMARY KEY (job_id)
	);

CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);

CREATE TABLE job_history (
	employee_id INT (11) UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT (11) UNSIGNED NOT NULL
	);

ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);


CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;

INSERT INTO regions
VALUES (
	1,
	'Europe'
	);

INSERT INTO regions
VALUES (
	2,
	'Americas'
	);

INSERT INTO regions
VALUES (
	3,
	'Asia'
	);

INSERT INTO regions
VALUES (
	4,
	'Middle East and Africa'
	);

COMMIT;

INSERT INTO countries
VALUES (
	'IT',
	'Italy',
	1
	);

INSERT INTO countries
VALUES (
	'JP',
	'Japan',
	3
	);

INSERT INTO countries
VALUES (
	'US',
	'United States of America',
	2
	);

INSERT INTO countries
VALUES (
	'CA',
	'Canada',
	2
	);

INSERT INTO countries
VALUES (
	'CN',
	'China',
	3
	);

INSERT INTO countries
VALUES (
	'IN',
	'India',
	3
	);

INSERT INTO countries
VALUES (
	'AU',
	'Australia',
	3
	);

INSERT INTO countries
VALUES (
	'ZW',
	'Zimbabwe',
	4
	);

INSERT INTO countries
VALUES (
	'SG',
	'Singapore',
	3
	);

INSERT INTO countries
VALUES (
	'UK',
	'United Kingdom',
	1
	);

INSERT INTO countries
VALUES (
	'FR',
	'France',
	1
	);

INSERT INTO countries
VALUES (
	'DE',
	'Germany',
	1
	);

INSERT INTO countries
VALUES (
	'ZM',
	'Zambia',
	4
	);

INSERT INTO countries
VALUES (
	'EG',
	'Egypt',
	4
	);

INSERT INTO countries
VALUES (
	'BR',
	'Brazil',
	2
	);

INSERT INTO countries
VALUES (
	'CH',
	'Switzerland',
	1
	);

INSERT INTO countries
VALUES (
	'NL',
	'Netherlands',
	1
	);

INSERT INTO countries
VALUES (
	'MX',
	'Mexico',
	2
	);

INSERT INTO countries
VALUES (
	'KW',
	'Kuwait',
	4
	);

INSERT INTO countries
VALUES (
	'IL',
	'Israel',
	4
	);

INSERT INTO countries
VALUES (
	'DK',
	'Denmark',
	1
	);

INSERT INTO countries
VALUES (
	'HK',
	'HongKong',
	3
	);

INSERT INTO countries
VALUES (
	'NG',
	'Nigeria',
	4
	);

INSERT INTO countries
VALUES (
	'AR',
	'Argentina',
	2
	);

INSERT INTO countries
VALUES (
	'BE',
	'Belgium',
	1
	);

COMMIT;

INSERT INTO locations
VALUES (
	1000,
	'1297 Via Cola di Rie',
	'00989',
	'Roma',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1100,
	'93091 Calle della Testa',
	'10934',
	'Venice',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1200,
	'2017 Shinjuku-ku',
	'1689',
	'Tokyo',
	'Tokyo Prefecture',
	'JP'
	);

INSERT INTO locations
VALUES (
	1300,
	'9450 Kamiya-cho',
	'6823',
	'Hiroshima',
	NULL,
	'JP'
	);

INSERT INTO locations
VALUES (
	1400,
	'2014 Jabberwocky Rd',
	'26192',
	'Southlake',
	'Texas',
	'US'
	);

INSERT INTO locations
VALUES (
	1500,
	'2011 Interiors Blvd',
	'99236',
	'South San Francisco',
	'California',
	'US'
	);

INSERT INTO locations
VALUES (
	1600,
	'2007 Zagora St',
	'50090',
	'South Brunswick',
	'New Jersey',
	'US'
	);

INSERT INTO locations
VALUES (
	1700,
	'2004 Charade Rd',
	'98199',
	'Seattle',
	'Washington',
	'US'
	);

INSERT INTO locations
VALUES (
	1800,
	'147 Spadina Ave',
	'M5V 2L7',
	'Toronto',
	'Ontario',
	'CA'
	);

INSERT INTO locations
VALUES (
	1900,
	'6092 Boxwood St',
	'YSW 9T2',
	'Whitehorse',
	'Yukon',
	'CA'
	);

INSERT INTO locations
VALUES (
	2000,
	'40-5-12 Laogianggen',
	'190518',
	'Beijing',
	NULL,
	'CN'
	);

INSERT INTO locations
VALUES (
	2100,
	'1298 Vileparle (E)',
	'490231',
	'Bombay',
	'Maharashtra',
	'IN'
	);

INSERT INTO locations
VALUES (
	2200,
	'12-98 Victoria Street',
	'2901',
	'Sydney',
	'New South Wales',
	'AU'
	);

INSERT INTO locations
VALUES (
	2300,
	'198 Clementi North',
	'540198',
	'Singapore',
	NULL,
	'SG'
	);

INSERT INTO locations
VALUES (
	2400,
	'8204 Arthur St',
	NULL,
	'London',
	NULL,
	'UK'
	);

INSERT INTO locations
VALUES (
	2500,
	'Magdalen Centre, The Oxford Science Park',
	'OX9 9ZB',
	'Oxford',
	'Oxford',
	'UK'
	);

INSERT INTO locations
VALUES (
	2600,
	'9702 Chester Road',
	'09629850293',
	'Stretford',
	'Manchester',
	'UK'
	);

INSERT INTO locations
VALUES (
	2700,
	'Schwanthalerstr. 7031',
	'80925',
	'Munich',
	'Bavaria',
	'DE'
	);

INSERT INTO locations
VALUES (
	2800,
	'Rua Frei Caneca 1360 ',
	'01307-002',
	'Sao Paulo',
	'Sao Paulo',
	'BR'
	);

INSERT INTO locations
VALUES (
	2900,
	'20 Rue des Corps-Saints',
	'1730',
	'Geneva',
	'Geneve',
	'CH'
	);

INSERT INTO locations
VALUES (
	3000,
	'Murtenstrasse 921',
	'3095',
	'Bern',
	'BE',
	'CH'
	);

INSERT INTO locations
VALUES (
	3100,
	'Pieter Breughelstraat 837',
	'3029SK',
	'Utrecht',
	'Utrecht',
	'NL'
	);

INSERT INTO locations
VALUES (
	3200,
	'Mariano Escobedo 9991',
	'11932',
	'Mexico City',
	'Distrito Federal,',
	'MX'
	);

COMMIT;

/* *************************************************************** 
***************************INSERTING DATA*************************
**************************************************************** */

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO departments
VALUES (
	10,
	'Administration',
	200,
	1700
	);

INSERT INTO departments
VALUES (
	20,
	'Marketing',
	201,
	1800
	);

INSERT INTO departments
VALUES (
	30,
	'Purchasing',
	114,
	1700
	);

INSERT INTO departments
VALUES (
	40,
	'Human Resources',
	203,
	2400
	);

INSERT INTO departments
VALUES (
	50,
	'Shipping',
	121,
	1500
	);

INSERT INTO departments
VALUES (
	60,
	'IT',
	103,
	1400
	);

INSERT INTO departments
VALUES (
	70,
	'Public Relations',
	204,
	2700
	);

INSERT INTO departments
VALUES (
	80,
	'Sales',
	145,
	2500
	);

INSERT INTO departments
VALUES (
	90,
	'Executive',
	100,
	1700
	);

INSERT INTO departments
VALUES (
	100,
	'Finance',
	108,
	1700
	);

INSERT INTO departments
VALUES (
	110,
	'Accounting',
	205,
	1700
	);

INSERT INTO departments
VALUES (
	120,
	'Treasury',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	130,
	'Corporate Tax',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	140,
	'Control And Credit',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	150,
	'Shareholder Services',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	160,
	'Benefits',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	170,
	'Manufacturing',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	180,
	'Construction',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	190,
	'Contracting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	200,
	'Operations',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	210,
	'IT Support',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	220,
	'NOC',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	230,
	'IT Helpdesk',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	240,
	'Government Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	250,
	'Retail Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	260,
	'Recruiting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	270,
	'Payroll',
	NULL,
	1700
	);

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

INSERT INTO jobs
VALUES (
	'AD_PRES',
	'President',
	20000,
	40000
	);

INSERT INTO jobs
VALUES (
	'AD_VP',
	'Administration Vice President',
	15000,
	30000
	);

INSERT INTO jobs
VALUES (
	'AD_ASST',
	'Administration Assistant',
	3000,
	6000
	);

INSERT INTO jobs
VALUES (
	'FI_MGR',
	'Finance Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'FI_ACCOUNT',
	'Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'AC_MGR',
	'Accounting Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'AC_ACCOUNT',
	'Public Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'SA_MAN',
	'Sales Manager',
	10000,
	20000
	);

INSERT INTO jobs
VALUES (
	'SA_REP',
	'Sales Representative',
	6000,
	12000
	);

INSERT INTO jobs
VALUES (
	'PU_MAN',
	'Purchasing Manager',
	8000,
	15000
	);

INSERT INTO jobs
VALUES (
	'PU_CLERK',
	'Purchasing Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'ST_MAN',
	'Stock Manager',
	5500,
	8500
	);

INSERT INTO jobs
VALUES (
	'ST_CLERK',
	'Stock Clerk',
	2000,
	5000
	);

INSERT INTO jobs
VALUES (
	'SH_CLERK',
	'Shipping Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'IT_PROG',
	'Programmer',
	4000,
	10000
	);

INSERT INTO jobs
VALUES (
	'MK_MAN',
	'Marketing Manager',
	9000,
	15000
	);

INSERT INTO jobs
VALUES (
	'MK_REP',
	'Marketing Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'HR_REP',
	'Human Resources Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'PR_REP',
	'Public Relations Representative',
	4500,
	10500
	);

COMMIT;

INSERT INTO employees
VALUES (
	100,
	'Steven',
	'King',
	'SKING',
	'515.123.4567',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),
	'AD_PRES',
	24000,
	NULL,
	NULL,
	90
	);

INSERT INTO employees
VALUES (
	101,
	'Neena',
	'Kochhar',
	'NKOCHHAR',
	'515.123.4568',
	STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	102,
	'Lex',
	'De Haan',
	'LDEHAAN',
	'515.123.4569',
	STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	103,
	'Alexander',
	'Hunold',
	'AHUNOLD',
	'590.423.4567',
	STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),
	'IT_PROG',
	9000,
	NULL,
	102,
	60
	);

INSERT INTO employees
VALUES (
	104,
	'Bruce',
	'Ernst',
	'BERNST',
	'590.423.4568',
	STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),
	'IT_PROG',
	6000,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	105,
	'David',
	'Austin',
	'DAUSTIN',
	'590.423.4569',
	STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	106,
	'Valli',
	'Pataballa',
	'VPATABAL',
	'590.423.4560',
	STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	107,
	'Diana',
	'Lorentz',
	'DLORENTZ',
	'590.423.5567',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'IT_PROG',
	4200,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	108,
	'Nancy',
	'Greenberg',
	'NGREENBE',
	'515.124.4569',
	STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),
	'FI_MGR',
	12000,
	NULL,
	101,
	100
	);

INSERT INTO employees
VALUES (
	109,
	'Daniel',
	'Faviet',
	'DFAVIET',
	'515.124.4169',
	STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),
	'FI_ACCOUNT',
	9000,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	110,
	'John',
	'Chen',
	'JCHEN',
	'515.124.4269',
	STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	8200,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	111,
	'Ismael',
	'Sciarra',
	'ISCIARRA',
	'515.124.4369',
	STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7700,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	112,
	'Jose Manuel',
	'Urman',
	'JMURMAN',
	'515.124.4469',
	STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7800,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	113,
	'Luis',
	'Popp',
	'LPOPP',
	'515.124.4567',
	STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),
	'FI_ACCOUNT',
	6900,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	114,
	'Den',
	'Raphaely',
	'DRAPHEAL',
	'515.127.4561',
	STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),
	'PU_MAN',
	11000,
	NULL,
	100,
	30
	);

INSERT INTO employees
VALUES (
	115,
	'Alexander',
	'Khoo',
	'AKHOO',
	'515.127.4562',
	STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),
	'PU_CLERK',
	3100,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	116,
	'Shelli',
	'Baida',
	'SBAIDA',
	'515.127.4563',
	STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2900,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	117,
	'Sigal',
	'Tobias',
	'STOBIAS',
	'515.127.4564',
	STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2800,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	118,
	'Guy',
	'Himuro',
	'GHIMURO',
	'515.127.4565',
	STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),
	'PU_CLERK',
	2600,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	119,
	'Karen',
	'Colmenares',
	'KCOLMENA',
	'515.127.4566',
	STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),
	'PU_CLERK',
	2500,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	120,
	'Matthew',
	'Weiss',
	'MWEISS',
	'650.123.1234',
	STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),
	'ST_MAN',
	8000,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	121,
	'Adam',
	'Fripp',
	'AFRIPP',
	'650.123.2234',
	STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),
	'ST_MAN',
	8200,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	122,
	'Payam',
	'Kaufling',
	'PKAUFLIN',
	'650.123.3234',
	STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),
	'ST_MAN',
	7900,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	123,
	'Shanta',
	'Vollman',
	'SVOLLMAN',
	'650.123.4234',
	STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),
	'ST_MAN',
	6500,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	124,
	'Kevin',
	'Mourgos',
	'KMOURGOS',
	'650.123.5234',
	STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),
	'ST_MAN',
	5800,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	125,
	'Julia',
	'Nayer',
	'JNAYER',
	'650.124.1214',
	STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	126,
	'Irene',
	'Mikkilineni',
	'IMIKKILI',
	'650.124.1224',
	STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	127,
	'James',
	'Landry',
	'JLANDRY',
	'650.124.1334',
	STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	128,
	'Steven',
	'Markle',
	'SMARKLE',
	'650.124.1434',
	STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	129,
	'Laura',
	'Bissot',
	'LBISSOT',
	'650.124.5234',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	130,
	'Mozhe',
	'Atkinson',
	'MATKINSO',
	'650.124.6234',
	STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2800,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	131,
	'James',
	'Marlow',
	'JAMRLOW',
	'650.124.7234',
	STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	132,
	'TJ',
	'Olson',
	'TJOLSON',
	'650.124.8234',
	STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	133,
	'Jason',
	'Mallin',
	'JMALLIN',
	'650.127.1934',
	STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	134,
	'Michael',
	'Rogers',
	'MROGERS',
	'650.127.1834',
	STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	135,
	'Ki',
	'Gee',
	'KGEE',
	'650.127.1734',
	STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	136,
	'Hazel',
	'Philtanker',
	'HPHILTAN',
	'650.127.1634',
	STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	137,
	'Renske',
	'Ladwig',
	'RLADWIG',
	'650.121.1234',
	STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3600,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	138,
	'Stephen',
	'Stiles',
	'SSTILES',
	'650.121.2034',
	STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	139,
	'John',
	'Seo',
	'JSEO',
	'650.121.2019',
	STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	140,
	'Joshua',
	'Patel',
	'JPATEL',
	'650.121.1834',
	STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	141,
	'Trenna',
	'Rajs',
	'TRAJS',
	'650.121.8009',
	STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	142,
	'Curtis',
	'Davies',
	'CDAVIES',
	'650.121.2994',
	STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	143,
	'Randall',
	'Matos',
	'RMATOS',
	'650.121.2874',
	STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	144,
	'Peter',
	'Vargas',
	'PVARGAS',
	'650.121.2004',
	STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	145,
	'John',
	'Russell',
	'JRUSSEL',
	'011.44.1344.429268',
	STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),
	'SA_MAN',
	14000,
	.4,
	100,
	80
	);

INSERT INTO employees
VALUES (
	146,
	'Karen',
	'Partners',
	'KPARTNER',
	'011.44.1344.467268',
	STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),
	'SA_MAN',
	13500,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	147,
	'Alberto',
	'Errazuriz',
	'AERRAZUR',
	'011.44.1344.429278',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_MAN',
	12000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	148,
	'Gerald',
	'Cambrault',
	'GCAMBRAU',
	'011.44.1344.619268',
	STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),
	'SA_MAN',
	11000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	149,
	'Eleni',
	'Zlotkey',
	'EZLOTKEY',
	'011.44.1344.429018',
	STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),
	'SA_MAN',
	10500,
	.2,
	100,
	80
	);

INSERT INTO employees
VALUES (
	150,
	'Peter',
	'Tucker',
	'PTUCKER',
	'011.44.1344.129268',
	STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.3,
	145,
	80
	);

INSERT INTO employees
VALUES (
	151,
	'David',
	'Bernstein',
	'DBERNSTE',
	'011.44.1344.345268',
	STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	152,
	'Peter',
	'Hall',
	'PHALL',
	'011.44.1344.478968',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	153,
	'Christopher',
	'Olsen',
	'COLSEN',
	'011.44.1344.498718',
	STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	154,
	'Nanette',
	'Cambrault',
	'NCAMBRAU',
	'011.44.1344.987668',
	STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	155,
	'Oliver',
	'Tuvault',
	'OTUVAULT',
	'011.44.1344.486508',
	STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	145,
	80
	);

INSERT INTO employees
VALUES (
	156,
	'Janette',
	'King',
	'JKING',
	'011.44.1345.429268',
	STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	157,
	'Patrick',
	'Sully',
	'PSULLY',
	'011.44.1345.929268',
	STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	158,
	'Allan',
	'McEwen',
	'AMCEWEN',
	'011.44.1345.829268',
	STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	159,
	'Lindsey',
	'Smith',
	'LSMITH',
	'011.44.1345.729268',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	160,
	'Louise',
	'Doran',
	'LDORAN',
	'011.44.1345.629268',
	STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	161,
	'Sarath',
	'Sewall',
	'SSEWALL',
	'011.44.1345.529268',
	STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.25,
	146,
	80
	);

INSERT INTO employees
VALUES (
	162,
	'Clara',
	'Vishney',
	'CVISHNEY',
	'011.44.1346.129268',
	STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),
	'SA_REP',
	10500,
	.25,
	147,
	80
	);

INSERT INTO employees
VALUES (
	163,
	'Danielle',
	'Greene',
	'DGREENE',
	'011.44.1346.229268',
	STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.15,
	147,
	80
	);

INSERT INTO employees
VALUES (
	164,
	'Mattea',
	'Marvins',
	'MMARVINS',
	'011.44.1346.329268',
	STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	7200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	165,
	'David',
	'Lee',
	'DLEE',
	'011.44.1346.529268',
	STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),
	'SA_REP',
	6800,
	.1,
	147,
	80
	);

INSERT INTO employees
VALUES (
	166,
	'Sundar',
	'Ande',
	'SANDE',
	'011.44.1346.629268',
	STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),
	'SA_REP',
	6400,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	167,
	'Amit',
	'Banda',
	'ABANDA',
	'011.44.1346.729268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	168,
	'Lisa',
	'Ozer',
	'LOZER',
	'011.44.1343.929268',
	STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	11500,
	.25,
	148,
	80
	);

INSERT INTO employees
VALUES (
	169,
	'Harrison',
	'Bloom',
	'HBLOOM',
	'011.44.1343.829268',
	STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	170,
	'Tayler',
	'Fox',
	'TFOX',
	'011.44.1343.729268',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SA_REP',
	9600,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	171,
	'William',
	'Smith',
	'WSMITH',
	'011.44.1343.629268',
	STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),
	'SA_REP',
	7400,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	172,
	'Elizabeth',
	'Bates',
	'EBATES',
	'011.44.1343.529268',
	STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	7300,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	173,
	'Sundita',
	'Kumar',
	'SKUMAR',
	'011.44.1343.329268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6100,
	.10,
	148,
	80
	);

INSERT INTO employees
VALUES (
	174,
	'Ellen',
	'Abel',
	'EABEL',
	'011.44.1644.429267',
	STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),
	'SA_REP',
	11000,
	.30,
	149,
	80
	);

INSERT INTO employees
VALUES (
	175,
	'Alyssa',
	'Hutton',
	'AHUTTON',
	'011.44.1644.429266',
	STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8800,
	.25,
	149,
	80
	);

INSERT INTO employees
VALUES (
	176,
	'Jonathon',
	'Taylor',
	'JTAYLOR',
	'011.44.1644.429265',
	STR_TO_DATE('24-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8600,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	177,
	'Jack',
	'Livingston',
	'JLIVINGS',
	'011.44.1644.429264',
	STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),
	'SA_REP',
	8400,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	178,
	'Kimberely',
	'Grant',
	'KGRANT',
	'011.44.1644.429263',
	STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	149,
	NULL
	);

INSERT INTO employees
VALUES (
	179,
	'Charles',
	'Johnson',
	'CJOHNSON',
	'011.44.1644.429262',
	STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	149,
	80
	);

INSERT INTO employees
VALUES (
	180,
	'Winston',
	'Taylor',
	'WTAYLOR',
	'650.507.9876',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	181,
	'Jean',
	'Fleaur',
	'JFLEAUR',
	'650.507.9877',
	STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	182,
	'Martha',
	'Sullivan',
	'MSULLIVA',
	'650.507.9878',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	183,
	'Girard',
	'Geoni',
	'GGEONI',
	'650.507.9879',
	STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	184,
	'Nandita',
	'Sarchand',
	'NSARCHAN',
	'650.509.1876',
	STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4200,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	185,
	'Alexis',
	'Bull',
	'ABULL',
	'650.509.2876',
	STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),
	'SH_CLERK',
	4100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	186,
	'Julia',
	'Dellinger',
	'JDELLING',
	'650.509.3876',
	STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3400,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	187,
	'Anthony',
	'Cabrio',
	'ACABRIO',
	'650.509.4876',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	188,
	'Kelly',
	'Chung',
	'KCHUNG',
	'650.505.1876',
	STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3800,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	189,
	'Jennifer',
	'Dilly',
	'JDILLY',
	'650.505.2876',
	STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3600,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	190,
	'Timothy',
	'Gates',
	'TGATES',
	'650.505.3876',
	STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	191,
	'Randall',
	'Perkins',
	'RPERKINS',
	'650.505.4876',
	STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	192,
	'Sarah',
	'Bell',
	'SBELL',
	'650.501.1876',
	STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4000,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	193,
	'Britney',
	'Everett',
	'BEVERETT',
	'650.501.2876',
	STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3900,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	194,
	'Samuel',
	'McCain',
	'SMCCAIN',
	'650.501.3876',
	STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	195,
	'Vance',
	'Jones',
	'VJONES',
	'650.501.4876',
	STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	196,
	'Alana',
	'Walsh',
	'AWALSH',
	'650.507.9811',
	STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	197,
	'Kevin',
	'Feeney',
	'KFEENEY',
	'650.507.9822',
	STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	198,
	'Donald',
	'OConnell',
	'DOCONNEL',
	'650.507.9833',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	199,
	'Douglas',
	'Grant',
	'DGRANT',
	'650.507.9844',
	STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	200,
	'Jennifer',
	'Whalen',
	'JWHALEN',
	'515.123.4444',
	STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),
	'AD_ASST',
	4400,
	NULL,
	101,
	10
	);

INSERT INTO employees
VALUES (
	201,
	'Michael',
	'Hartstein',
	'MHARTSTE',
	'515.123.5555',
	STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),
	'MK_MAN',
	13000,
	NULL,
	100,
	20
	);

INSERT INTO employees
VALUES (
	202,
	'Pat',
	'Fay',
	'PFAY',
	'603.123.6666',
	STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),
	'MK_REP',
	6000,
	NULL,
	201,
	20
	);

INSERT INTO employees
VALUES (
	203,
	'Susan',
	'Mavris',
	'SMAVRIS',
	'515.123.7777',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'HR_REP',
	6500,
	NULL,
	101,
	40
	);

INSERT INTO employees
VALUES (
	204,
	'Hermann',
	'Baer',
	'HBAER',
	'515.123.8888',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'PR_REP',
	10000,
	NULL,
	101,
	70
	);

INSERT INTO employees
VALUES (
	205,
	'Shelley',
	'Higgins',
	'SHIGGINS',
	'515.123.8080',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_MGR',
	12000,
	NULL,
	101,
	110
	);

INSERT INTO employees
VALUES (
	206,
	'William',
	'Gietz',
	'WGIETZ',
	'51hr5.123.8181',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_ACCOUNT',
	8300,
	NULL,
	205,
	110
	);

COMMIT;

INSERT INTO job_history
VALUES (
	102,
	STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),
	STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),
	'IT_PROG',
	60
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),
	STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),
	'AC_ACCOUNT',
	110
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),
	STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),
	'AC_MGR',
	110
	);

INSERT INTO job_history
VALUES (
	201,
	STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),
	STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),
	'MK_REP',
	20
	);

INSERT INTO job_history
VALUES (
	114,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	122,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),
	STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),
	'AD_ASST',
	90
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'SA_REP',
	80
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'SA_MAN',
	80
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'AC_ACCOUNT',
	90
	);
    
COMMIT;

/* *************************************************************** 
***************************FOREIGN KEYS***************************
**************************************************************** */

ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);    
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

use hr;

show tables;

-- Write appropriate SQL queries for the following problems. 

-- Part 1
-- 1. Find a unique department Id from the employee's table. 
select distinct department_id from employees;

-- 2.Write a query to get all employee details from the employee table in order by first name, descending.
select * from employees order by first_name desc;

-- 3. Write a query to get the names (first_name, last_name), salary, and PF of all the employees (PF is calculated as 15% of salary)
select concat(first_name," ",last_name) "Full_Name", Salary, salary*0.15 PF from employees;

-- 4. Write a query to select the first 10 records from a table.
select * from employees limit 10;

-- 5. Select all job titles whose maximum salary is > 10000 
select job_title, max_salary from jobs where max_salary>10000;

-- 6.	Select all job titles whose minimum salary is > 8000 and max salary < 20000 
select job_title , min_salary, max_salary from jobs where min_salary > 8000 and max_salary < 20000;

-- 7.	Select all locations (id, city) which do not have any state province mentioned
select location_id, city from locations where state_province is null;

-- 8.	List all IT-related departments where there are no managers 
select department_name from departments where department_name like "IT%" and manager_id is null;

-- 9.	List all departments with managers for location id 1700
select * from departments where manager_Id is not null and location_id = 1700;

-- 10.	List employee id, first name and their GROSS salaries whose monthly GROSS salary > 12000. Show the least to highest gross salaries in the output.
select employee_id, first_name, salary+(salary*commission_pct)-salary*0.15 Gross_salary  from employees 
where salary+(salary*commission_pct)-salary*0.15>12000 
order by Gross_salary; 

-- 11.	Show location id and cities of US or UK whose city name starts from 'S' but not from 'South'.
select location_id , city, country_id from locations where country_id in ("US", "UK")
and city like "S%" and city not like "South%";

-- 12.	Print a bonafide certificate for an employee (say for emp. id 123) as below:
-- "This is to certify that <full name> with employee id <emp. id> is working as <job id> in dept. <dept. no.> since <join date>. His/her annual gross salary is $<gross_sal>.00". 
Select concat("This is to certify that ",concat(first_name," ",last_name),
" with employee id ", employee_id," is working as ", job_id," in dept. ",department_id," since ",hire_date,
". His/Her annuyal gross salary is $",truncate(salary+(salary*commission_pct)-salary*0.15,2),".") Bonafide_certificate 
from employees where employee_id = 175; 

-- Part 2
use hr;
-- 1.	Write a query to get the minimum salary from the employees table.
select min(salary) from employees;

-- 2.	Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary) from employees where job_id = "IT_PROG";

-- 3.	Write a query to get the average salary and number of employees working in the     department 90.
select avg(salary) , count(employee_id) from employees where department_id = 90;

-- 4.	Write a query to get the department ID and the total salary payable in each department. 
select department_id, sum(salary) from employees group by department_id;

-- 5.	Find total sum of salary paid to all employees in department 30.
select department_id, sum(salary) from employees where department_id = 30 group by department_id;


-- 7.	Get the job id-wise count of employees in the reverse order of the count (19 rows).
select job_id, count(employee_id) from employees group by job_Id order by count(employee_id) desc;

-- 8.	Show no. of employees present in each department (exclude NULL depts, if any) (11 rows).
select department_id, count(employee_id) from employees where department_id is not null group by department_id;
-- 9.	Show department-wise and job-id-wise total gross salaries of employees whose gross salary is more than 25000 (8 rows).
select department_id,job_id,  case when commission_pct is not null then sum(salary+(salary*commission_pct)-salary*0.15) 
else sum(salary-salary*0.15) end  total_gross_salary from employees group by department_id
having sum(salary+(salary*commission_pct)-salary*0.15) > 25000;

select commission_pct from employees;

-- 10.	Show all Employees names along with their department name which has salary greater than 10000 order by salary in descending order.
select concat(first_Name," ",last_name) Name, salary from employees where salary > 10000 order by salary desc;

-- 11.	Show all Employee names along with their job title where hire date is greater than ‘1990-01-03’ order by job title.

select first_name, last_name, job_title from employees a left join jobs b on a.job_id = b.job_Id where hire_date > 1990-01-03;

-- 12.	Show all department names which exist in the country US.
select distinct(department_name) from departments a inner join locations b where country_id = "US";
-- 13.	Show the job history of employee Neena.
select b.employee_Id, b.start_date, end_date, b.job_id, b.department_id from employees a inner join job_history b
on a.employee_Id = b.employee_Id where first_name = "Neena";
-- 14.	Show all the countries in the region ‘Asia’.
select country_name from countries a left join regions b on a.region_id = b.region_Id where region_name = "Asia";
-- 15.	Show all details of employees working in the Finance department.
select employee_id, first_name, last_name, email,phone_number, hire_date, job_id, salary, commission_pct, a.manager_id, a.department_id
from employees a left join departments b on a.department_id = b.department_id 
where department_name = "Finance";
-- 16.	Show all details of employees working as Programmer.
select * from employees where job_id = "IT_PROG";
-- 17.	Display all department names, the city where these are located along with the manager name of the departments.
select department_name, city, concat(first_name," ",last_name) Manager_name from (departments a left join locations b 
on a.location_id = b.location_id) left join employees c on a.manager_id= c.employee_id group by department_name;
-- Part 3
-- 1.	Write appropriate SQL queries for the following problems. 

-- 2.	Show complete details of an employee: Full name, dept name, job title, city and country name. (106 rows).
select concat(first_name," ",last_name) Full_Name,job_title, city, country_name from (((employees a left join jobs b 
on a.job_id =b.job_id) left join departments c on a.department_id = c.department_Id) left join locations d
on c.location_id = d.location_id) left join countries e on d.country_id = e.country_id;
-- 3.	Display names of cities where there are more than 2 departments. (1 row).
select city, count(department_id) Departments_count from locations a left join departments b 
on a.location_id = b.location_id group by city having count(department_id) >2; 

-- 4.	Show city, state province and dept. name for ALL locations. Show 'No Dept.' if a city doesn't have any dept. in it. (43 rows).
select city, state_province,  case when department_name is null then "No Dept" else department_name end department_name 
from locations a left join departments b on
a.location_Id = b.location_Id ;

-- 5.	Display employees who do the same job as 'Kevin Feeney'. (20 rows).
select employee_Id , first_name, last_name from employees where job_id = 
(select job_Id from employees where concat(first_name," ",last_name)="Kevin Feeney");
-- 6.	Display employees who do the same job as 'Kevin Feeney' but earn more salary than him. (11 rows).
select employee_Id , first_name, last_name from employees where job_id = 
(select job_Id from employees where concat(first_name," ",last_name)="Kevin Feeney") and
salary > (select salary from employees where concat(first_name," ", last_name) = "Kevin Feeney");
-- 7.	How many employees' salary is higher than the average salary in each of their respective departments? (Ans: 38).
select count(employee_Id) from employees a where salary > 
(select avg(salary) from employees b where b.department_id =a.department_id group by a.department_id);

-- Part 4
-- 1.	Write a query to get unique department ID from employee table.
select distinct(department_id) from employees;
-- 2.	Write a query to get all employee details from the employee table order by first name, descending.
select * from employees order by first_Name desc;
-- 3.	Write a query to get the average salary and number of employees in the employees table.
select avg(salary) , count(employee_id) from employees ;
-- 4.	Write a query to get the number of employees working with the company.
select count(employee_id) from employees a where not exists (select employee_id from job_history b where a.employee_id = b.employee_id );
-- 5.	Write a query to get the list of jobs in the employees table.
select distinct(job_title) from employees a inner join jobs b on a.job_id = b.job_id;
-- 6.	Write a query get all first name from employees table in upper case.
select upper(first_name) from employees;
-- 7.	Write a query to get the first 3 characters of first name from employees table.
select left(first_name, 3) from employees;
-- 8.	Write a query to get the length of the employee names (first_name, last_name) from employees table.
select length(concat(first_name,last_name)) from employees;
/* 9.	Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000
 through $15,000.*/
 select concat(first_name," ",last_name) from employees where salary between 10000 and 15000;
-- 10.	Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
select concat(first_name," ",last_name), department_Id from employees where department_Id in (30,100) order by department_Id;
-- 11.	Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
select concat(first_name," ",last_name) , salary from employees where salary between 10000 and 15000 and department_Id in (30,100);
-- 12.	Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
select concat(first_name," ",last_name), hire_date from employees where year(hire_date) = 1987;

-- 13.	Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
select first_name from employees where first_name like "%b%" and first_name like "%c%";

-- 14.	Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk and whose salary is not equal to $4,500, $10,000, or $15,000.
select last_name, job_title, salary from employees a left join jobs b on a.job_Id = b.job_id where job_title in ("Programmer", "Shipping Clerk") and salary not in (4500, 10000, 15000);

-- 15.	Write a query to display the last name of employees whose names have exactly 6 characters.
select last_name from employees where length(last_name) = 6;
-- 16.	Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary) from employees a left join jobs b on a.job_id = b.job_id where job_title = "Programmer";
-- 17.	Write a query to get the average salary and number of employees working the department 90.
select avg(salary), count(employee_Id) from employees where department_id = 90;
-- 18.	Write a query to get the number of employees with the same job.
select job_id , count(employee_id) from employees group by job_id;
-- 19.	Write a query to get the average salary for each job ID excluding programmer.
select a.job_id , count(employee_Id) from employees a left join jobs b on a.job_id = b.job_id where job_title != "Programmer" group by a.job_id;
-- 20.	Write a query to get the total salary, maximum, minimum, and average salary of employees (job ID wise), for department ID 90 only.
select job_id, sum(salary) total_salary, max(salary) max_salary, min(salary) min_salary, avg(salary) avg_salary from employees
where department_id = 90 group by job_id;
-- 21.	Write a query to get the job ID and maximum salary of the employees where the maximum salary is greater than or equal to $4000.
select job_Id, max(salary) from employees group by job_Id having max(salary)>= 4000;

-- 22.	Write a query to get the average salary for all departments employing more than 10 employees.
select department_Id, avg(salary) "Average Salary" from employees group by department_id having  count(employee_Id)>10;
-- 23.	Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
select concat(first_name," ",last_name) , salary from employees where salary>(select salary from employees where last_name = "Bull");
-- 24.	Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select concat(first_name," ", last_Name), salary from employees where salary>(select avg(salary) from employees);
-- 25.	Write a query to find the name (first_name, last_name), and salary of the employees who earn more than the earning of Mr. Bell.
select concat(first_name," ", last_name) Name, salary from employees where salary>(select salary from employees where last_name = "Bell");

-- 26.	Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select department_id, a.location_id, street_address, city, state_province, country_name from
(departments a left join locations b on a.location_Id=b.location_Id) left join countries c on b.country_id = c.country_id;
-- 27.	Write a query to find the name (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
select first_name, last_name, hire_date from employees where hire_date > (select hire_date from employees where last_name = "Jones");
-- 28.	Write a query to show the email field after appending '@example.com' to it.
select employee_id,concat(email,"@example.com") from employees;
-- 29.	Write a query to extract the last 4 characters of phone numbers.
select right(phone_Number,4) from employees;
-- 30.	Write a query to display the first name and salary of all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
select first_name, lpad(format(salary,2),10,"$") Salary from employees;