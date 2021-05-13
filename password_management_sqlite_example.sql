
--set up tables
CREATE TABLE "accounts" (
	"id"	INTEGER,
	"account_name"	TEXT,
	"pass"	TEXT,
	"key"	TEXT,
	"seckey"	TEXT,
	"token"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "usage" (
	"id"	INTEGER,
	"script_name"	TEXT,
	"script_location"	TEXT,
	"account_id"	TEXT,
	FOREIGN KEY("account_id") REFERENCES accounts(id) ,
	PRIMARY KEY("id" AUTOINCREMENT)
);

--enter account information
insert into accounts (account_name, pass, key, seckey, token)
values('twitteraccount', 'pass1', 'key1', 'seck1', 'tock1'),
values('redditaccount', 'pass2', 'key2', 'seck2', 'tock2');

--enter file usage

insert into usage (script_name, script_location)
values('python.py', 'C:\Users\user\myscripts\project1');

update usage set account_id = (select id from accounts where account_name = 'twitteraccount')
where script_name = 'python.py';
