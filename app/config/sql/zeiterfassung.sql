drop table IF EXISTS configurations;
drop table IF EXISTS tasks;
drop table IF EXISTS clients;
drop table IF EXISTS vacations;
drop table IF EXISTS users;
drop table IF EXISTS groups;

create table groups (
	id integer not null auto_increment primary key,
	name varchar(50) not null,
	parent_id integer default 0
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table users (
	id integer not null auto_increment primary key,
	username varchar(50) not null,
	password varchar(40) not null,
	fullname varchar(50) not null,
	group_id integer not null,
	constraint group_id_key foreign key (group_id) references groups (id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table vacations (
	id integer not null auto_increment primary key,
	date datetime not null,
	user_id integer not null,
	constraint user_id_key foreign key (user_id) references users (id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table clients (
	id integer not null auto_increment primary key,
	name varchar(50) not null
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table tasks (
	id integer auto_increment primary key,
	description varchar(50) not null,
	starttime_morning datetime not null,
	endtime_morning datetime not null,
	starttime_afternoon datetime not null,
	endtime_afternoon datetime not null,
	ipaddress varchar(15) not null,
	client_id integer not null,
	constraint client_id_key foreign key (client_id) references clients (id),
	proxy_id integer,
	constraint proxy_key foreign key (proxy_id) references users (id),
	user_id integer,
	constraint owner_id_key foreign key (user_id) references users (id)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table configurations (
  id integer not null auto_increment primary key,
  name varchar(255) default null,
  value text
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO clients VALUES ('1', 'IBM Forum');
INSERT INTO clients VALUES ('2', 'HSG Zander');
INSERT INTO clients VALUES ('3', 'Labor');

INSERT INTO groups VALUES ('1', 'Mitarbeiter', null);
INSERT INTO groups VALUES ('2', 'Supervisor', 1);
INSERT INTO groups VALUES ('3', 'Administrator', 2);
INSERT INTO users VALUES (
	'1',
	'christian_b@gmx.net',
	'cd076bf034d78031b140ff6cf033b84b43c1e9f7',
	'Oliver Munz',
	'1'
);
INSERT INTO users VALUES (
	'2',
	'bla@de.de',
	'cd076bf034d78031b140ff6cf033b84b43c1e9f7',
	'Jochen Pöhler',
	'2'
);
INSERT INTO users VALUES (
	'3',
	'frank@gmx.net',
	'cd076bf034d78031b140ff6cf033b84b43c1e9f7',
	'Frank Blumentopf',
	'3'
);



INSERT INTO configurations VALUES ('1', 'SITE_NAME', 'Time Sheet');
INSERT INTO configurations VALUES ('2', 'SITE_EMAIL', 'timesheet@domain.com');
INSERT INTO configurations VALUES ('3', 'SMTP_HOST', 'mail.domain.com');
INSERT INTO configurations VALUES ('4', 'SMTP_USER', 'login@domain.com');
INSERT INTO configurations VALUES ('5', 'SMTP_PASS', 'password');
INSERT INTO configurations VALUES ('6', 'CRON_LASTRUN', '0');
INSERT INTO configurations VALUES ('7', 'CRON_INTERVAL', '1440');
INSERT INTO configurations VALUES ('8', 'CRON_RETRY_INTERVAL', '60');

