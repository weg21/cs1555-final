DROP TABLE profile CASCADE CONSTRAINTS;
DROP TABLE friends CASCADE CONSTRAINTS;
DROP TABLE pendingFriends CASCADE CONSTRAINTS;
DROP TABLE messages CASCADE CONSTRAINTS;
DROP TABLE messageRecipient CASCADE CONSTRAINTS;
DROP TABLE groups CASCADE CONSTRAINTS;
DROP TABLE groupMembership CASCADE CONSTRAINTS;
DROP TABLE pendingGroupMembers CASCADE CONSTRAINTS;

CREATE TABLE profile (
	userID        varchar2(20),
	name          varchar2(50) NOT NULL,
	password      varchar2(50) NOT NULL,
	date_of_birth date,
	lastLogin     timestamp,
	CONSTRAINT pk_profile PRIMARY KEY(userID) DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE friends (
	userID1 varchar2(20),
	userID2 varchar2(20),
	JDate   date          NOT NULL,
	message varchar2(200) DEFAULT NULL,
<<<<<<< HEAD
	CONSTRAINT pk_friends PRIMARY KEY(userID1, userID2) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_friends_userID1 FOREIGN KEY(userID1) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_friends_userID2 FOREIGN KEY(userID2) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
=======
	CONSTRAINT pk_friends PRIMARY KEY(userID1, userID2),
	CONSTRAINT fk_friends_userID1 FOREIGN KEY(userID1) REFERENCES 
profile(userID),
	CONSTRAINT fk_friends_userID2 FOREIGN KEY(userID2) REFERENCES 
profile(userID)
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
);

CREATE TABLE pendingFriends (
	fromID  varchar2(20),
	toID    varchar2(20),
	message varchar2(200) DEFAULT NULL,
<<<<<<< HEAD
	CONSTRAINT pk_pending_friends PRIMARY KEY(fromID, toID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingFriends_fromID FOREIGN KEY(fromID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingFriends_toID FOREIGN KEY(toID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
=======
	CONSTRAINT pk_pending_friends PRIMARY KEY(fromID, toID),
	CONSTRAINT fk_pendingFriends_fromID FOREIGN KEY(fromID) REFERENCES 
profile(userID),
	CONSTRAINT fk_pendingFriends_toID FOREIGN KEY(toID) REFERENCES 
profile(userID)
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
);

CREATE TABLE groups (
	gID         varchar2(20),
	name        varchar2(20)  NOT NULL,
	description varchar2(200) DEFAULT NULL,
	CONSTRAINT pk_groups PRIMARY KEY(gID) DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE messages (
	msgID     varchar2(20),
	fromID    varchar2(20)  NOT NULL,
	message   varchar2(200) DEFAULT NULL,
	toUserID  varchar2(20)  DEFAULT NULL,
	toGroupID varchar2(20)  DEFAULT NULL,
<<<<<<< HEAD
	dateSent  date          NOT NULL,
	CONSTRAINT pk_messages PRIMARY KEY(msgID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_fromID FOREIGN KEY(fromID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_toUserID FOREIGN KEY(toUserID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_toGroupID FOREIGN KEY(toGroupID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT ic_messages1 CHECK(toUserID IS NOT NULL OR toGroupID IS NOT NULL) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT ic_messages2 CHECK((toUserID IS NOT NULL AND toGroupID IS NULL) OR (toUserID IS NULL AND toGroupID IS NOT NULL))  DEFERABLE INITIALLY IMEDIATE
=======
	dateSent  date          NOT NULL, --????????????
	CONSTRAINT pk_messages PRIMARY KEY(msgID),
	CONSTRAINT fk_messages_fromID FOREIGN KEY(fromID) REFERENCES 
profile(userID),
	CONSTRAINT fk_messages_toUserID FOREIGN KEY(toUserID) REFERENCES 
profile(userID),
	CONSTRAINT fk_messages_toGroupID FOREIGN KEY(toGroupID) REFERENCES 
groups(gID) 
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
);

CREATE TABLE messageRecipient (
	msgID  varchar2(20),
<<<<<<< HEAD
	userID varchar2(20),
	CONSTRAINT pk_messageRecipient PRIMARY KEY(msgID, userID) DEFERABLE INITIALLY IMEDIATE,
	--NOTE: I used both msgID and userID for the pk in case one message could be sent to multiple people via a group
	CONSTRAINT fk_messageRecipient_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
=======
	userID varchar2(20) NOT NULL, --????????????
	CONSTRAINT pk_messageRecipient PRIMARY KEY(msgID),
	CONSTRAINT fk_messageRecipient_userID FOREIGN KEY(userID) 
REFERENCES profile(userID)
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
);

CREATE TABLE groupMembership (
	gID   varchar2(20),
	userID varchar2(20),
<<<<<<< HEAD
	role   varchar2(20) DEFAULT 'member', --assuming this is the default vaule for role
	CONSTRAINT pk_groupMembership PRIMARY KEY(gID, userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_groupMembership_gID FOREIGN KEY(gID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_groupMembership_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
=======
	role   varchar2(20) DEFAULT 'member', --????????????
	CONSTRAINT pk_groupMembership PRIMARY KEY(gID, userID),
	CONSTRAINT fk_groupMembership_gID FOREIGN KEY(gID) REFERENCES 
groups(gID),
	CONSTRAINT fk_groupMembership_userID FOREIGN KEY(userID) 
REFERENCES profile(userID)
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
);

CREATE TABLE pendingGroupMembers (
	gID      varchar2(20),
	userID  varchar2(20),
	message varchar2(200) DEFAULT NULL,
<<<<<<< HEAD
	CONSTRAINT pk_pendingGroupMembers PRIMARY KEY(gID, userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingGroupMembers_gID FOREIGN KEY(gID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingGroupMembers_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
);
=======
	CONSTRAINT pk_pendingGroupMembers PRIMARY KEY(gID, userID),
	CONSTRAINT fk_pendingGroupMembers_gID FOREIGN KEY(gID) REFERENCES 
groups(gID),
	CONSTRAINT fk_pendingGroupMembers_userID FOREIGN KEY(userID) 
REFERENCES profile(userID)
);

INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111111,'Lev 
Slater','QGE00WVV1AA','27-Dec-90',TO_TIMESTAMP('01-Nov-14:06:09','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111112,'Oleg 
Mayo','NHE60IYF1KN','17-Apr-88',TO_TIMESTAMP('01-Nov-14:08:30','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111113,'Justine 
Dillon','GSZ32RQT6OQ','15-Dec-74',TO_TIMESTAMP('01-Nov-14:05:06','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111114,'Madonna 
Roberts','RNJ54BWH4GS','13-May-80',TO_TIMESTAMP('01-Nov-14:10:05','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111115,'Justin 
Floyd','FYE55ODR2TE','22-Apr-54',TO_TIMESTAMP('01-Nov-14:19:18','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111116,'Abraham 
Bond','SJO19ZWC2XL','30-Sep-65',TO_TIMESTAMP('01-Nov-14:04:05','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111117,'Anjolie 
Wolf','SDM51HXW1TK','08-Aug-97',TO_TIMESTAMP('01-Nov-14:11:19','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111118,'Rafael 
Barton','KMI96LFH3AQ','09-Aug-60',TO_TIMESTAMP('01-Nov-14:17:33','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111119,'Zane 
Baker','WKJ91ZZL4XU','03-Jun-55',TO_TIMESTAMP('01-Nov-14:21:10','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111120,'Eagan 
Talley','SNO28XBY9SO','30-Dec-96',TO_TIMESTAMP('01-Nov-14:06:09','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111121,'Gavin 
Nguyen','UTU28TDF1YQ','30-Oct-51',TO_TIMESTAMP('01-Nov-14:12:09','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111122,'Naomi 
Glover','FOM84FOY6PM','02-Jan-59',TO_TIMESTAMP('01-Nov-14:14:57','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111123,'Jaquelyn 
Reynolds','XQZ49FVJ3OW','08-Jan-56',TO_TIMESTAMP('01-Nov-14:06:47','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111124,'Germaine 
Houston','GHA20SGI0FB','17-Aug-67',TO_TIMESTAMP('01-Nov-14:02:05','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111125,'Yeo 
Roberson','YNB01XDE5UJ','13-Aug-73',TO_TIMESTAMP('01-Nov-14:16:00','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111126,'Fredericka 
Doyle','PLS82JMV6JP','26-Dec-87',TO_TIMESTAMP('01-Nov-14:19:51','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111127,'Deanna 
Roy','EQX86MEM2DA','17-Apr-82',TO_TIMESTAMP('01-Nov-14:03:26','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111128,'Ila 
Howe','ZQT35GMS4PA','16-Jan-76',TO_TIMESTAMP('01-Nov-14:19:15','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111129,'Debra 
Lang','LMI61QDL2GI','12-Aug-65',TO_TIMESTAMP('01-Nov-14:00:26','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111130,'Tucker 
Mcdonald','JXY83QOE7UW','02-Apr-94',TO_TIMESTAMP('01-Nov-14:14:57','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111131,'Keiko 
Hendrix','GLP27TCY5IV','26-Jan-57',TO_TIMESTAMP('01-Nov-14:13:46','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111132,'Keith 
Carr','MNH38GXO7OB','09-Jan-77',TO_TIMESTAMP('01-Nov-14:21:21','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111133,'Lane 
Holloway','VSF90IWE1BT','03-Oct-55',TO_TIMESTAMP('01-Nov-14:07:21','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111134,'Amber 
Graham','XFK67QOR4ML','19-Apr-62',TO_TIMESTAMP('01-Nov-14:18:23','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111135,'Whitney 
Vasquez','FYG27XHI4JH','28-May-67',TO_TIMESTAMP('01-Nov-14:03:30','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111136,'Walter 
Page','JMS15CLJ6TN','26-Feb-72',TO_TIMESTAMP('01-Nov-14:09:44','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111137,'Zachery 
Cantrell','ZTA21QDM5QW','23-Jan-76',TO_TIMESTAMP('01-Nov-14:04:49','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111138,'Judith 
Downs','DOK83XTI3NC','14-Aug-72',TO_TIMESTAMP('01-Nov-14:22:19','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111139,'Galena 
Curtis','JEC88SDP3FB','02-May-57',TO_TIMESTAMP('01-Nov-14:14:53','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111140,'Martin 
Shaw','VQO04KFN4OE','04-Feb-87',TO_TIMESTAMP('01-Nov-14:21:44','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111141,'Sonia 
West','TJQ41JGG9WW','20-Mar-99',TO_TIMESTAMP('01-Nov-14:09:46','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111142,'Hyatt 
Oneill','HLN83UOK5EG','25-Aug-85',TO_TIMESTAMP('01-Nov-14:20:03','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111143,'Noelani 
Stein','FVX05MGM6AH','13-Jan-93',TO_TIMESTAMP('01-Nov-14:11:55','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111144,'Eagan 
Paul','JFX33SSK6DQ','16-Jul-74',TO_TIMESTAMP('01-Nov-14:05:16','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111145,'Susan 
Wheeler','KNM63ZCI1CQ','16-Jun-54',TO_TIMESTAMP('01-Nov-14:23:51','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111146,'Amal 
Hinton','LJE08IYJ9XU','07-Jan-97',TO_TIMESTAMP('01-Nov-14:03:01','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111147,'Hanna 
Mccarty','VVZ75AJI9HN','06-Jul-62',TO_TIMESTAMP('01-Nov-14:22:09','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111148,'Keane 
Beach','ISU60RBO7QK','14-Sep-77',TO_TIMESTAMP('01-Nov-14:08:14','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111149,'Lilah 
Dickerson','ZWB48CGB9EW','06-Jul-96',TO_TIMESTAMP('01-Nov-14:07:12','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111150,'Melissa 
Wyatt','XSI43GOW8ZY','06-Jun-87',TO_TIMESTAMP('01-Nov-14:22:25','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111151,'Lyle 
Benjamin','MWT03ZZJ1TI','22-Oct-93',TO_TIMESTAMP('01-Nov-14:03:12','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111152,'Christopher 
Calderon','GNA74GCQ0QD','13-Nov-90',TO_TIMESTAMP('01-Nov-14:22:30','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111153,'Renee 
Goff','STX43OPP2CF','13-Feb-99',TO_TIMESTAMP('01-Nov-14:16:48','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111154,'Paula 
Ortiz','GUK96VEU1PH','27-Sep-66',TO_TIMESTAMP('01-Nov-14:04:17','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111155,'Hasad 
Coffey','KDX29NSK0PE','17-Nov-66',TO_TIMESTAMP('01-Nov-14:14:37','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111156,'Lynn 
Clark','BRL33DIE8KJ','26-Jun-54',TO_TIMESTAMP('01-Nov-14:11:12','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111157,'Kirsten 
Barlow','DMS10XQH0NP','13-Aug-78',TO_TIMESTAMP('01-Nov-14:03:20','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111158,'Renee 
Cannon','PEL52ZRP4EH','17-Feb-77',TO_TIMESTAMP('01-Nov-14:06:42','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111159,'Ralph 
Holder','WBQ05KEC9QW','19-Oct-79',TO_TIMESTAMP('01-Nov-14:10:17','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111160,'Macaulay 
Koch','VAM74JDH1KM','09-Jun-84',TO_TIMESTAMP('01-Nov-14:00:57','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111161,'Cullen 
Combs','GVC69WWC7BK','05-Mar-77',TO_TIMESTAMP('01-Nov-14:07:17','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111162,'Chloe 
Best','YKC81CQI8MR','07-Sep-66',TO_TIMESTAMP('01-Nov-14:11:35','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111163,'Hasad 
Hansen','FRD23HMO2WX','24-Feb-84',TO_TIMESTAMP('01-Nov-14:11:46','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111164,'Brady 
Casey','GXO63KSJ3AO','13-May-55',TO_TIMESTAMP('01-Nov-14:14:04','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111165,'Kai 
Clay','PUS89CFO7MG','05-Sep-65',TO_TIMESTAMP('01-Nov-14:18:59','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111166,'Nasim 
Howe','ZBF06GEY6ZC','12-Sep-51',TO_TIMESTAMP('01-Nov-14:11:21','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111167,'Wayne 
Guy','DJY34QTR0ZX','10-Oct-65',TO_TIMESTAMP('01-Nov-14:08:03','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111168,'Hayfa 
Molina','ZKJ23HDT9ZI','20-Sep-89',TO_TIMESTAMP('01-Nov-14:05:42','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111169,'Zelenia 
Mathews','VPE01RJQ3YK','04-Oct-74',TO_TIMESTAMP('01-Nov-14:04:31','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111170,'Hyacinth 
Black','GEA65FPJ9HQ','13-Nov-86',TO_TIMESTAMP('01-Nov-14:19:38','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111171,'Len 
Rivera','PHB63BUE8NK','22-Dec-94',TO_TIMESTAMP('01-Nov-14:22:25','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111172,'Aphrodite 
Contreras','LNM35JDM4KT','19-Feb-99',TO_TIMESTAMP('01-Nov-14:17:08','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111173,'Porter 
Keller','OWV28BGA4ZS','28-Feb-89',TO_TIMESTAMP('01-Nov-14:11:14','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111174,'Cain 
Battle','OID71RNL8XL','23-Aug-86',TO_TIMESTAMP('01-Nov-14:09:22','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111175,'Geoffrey 
Patton','VCS26BSL2JF','11-Feb-73',TO_TIMESTAMP('01-Nov-14:02:25','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111176,'Gannon 
Mcguire','ZWF14AKA6UC','22-Jan-61',TO_TIMESTAMP('01-Nov-14:12:33','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111177,'Sheila 
Warren','HAB86ZKX5PS','11-Oct-93',TO_TIMESTAMP('01-Nov-14:08:37','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111178,'Illiana 
Schultz','ZIJ74KYO5UY','21-Nov-90',TO_TIMESTAMP('01-Nov-14:22:35','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111179,'Vaughan 
Cruz','MJK09VYH0SB','20-Aug-52',TO_TIMESTAMP('01-Nov-14:03:00','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111180,'Carol 
Weeks','HEM49JKX3EV','24-Feb-78',TO_TIMESTAMP('01-Nov-14:02:03','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111181,'Jayme 
Brennan','CAQ87BNI6NV','07-Aug-74',TO_TIMESTAMP('01-Nov-14:07:10','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111182,'Alexa 
Good','CGO64RQI6WV','04-Aug-70',TO_TIMESTAMP('01-Nov-14:08:26','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111183,'Clare 
Phelps','RUB01YHX7PS','30-Dec-55',TO_TIMESTAMP('01-Nov-14:11:09','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111184,'Ferdinand 
Oneil','OFP37WUW7ED','01-May-75',TO_TIMESTAMP('01-Nov-14:23:15','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111185,'Trevor 
Owen','EWD01DLD0CG','10-May-00',TO_TIMESTAMP('01-Nov-14:09:36','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111186,'Dakota 
Olson','HWI50WDX1HV','20-Aug-71',TO_TIMESTAMP('01-Nov-14:06:40','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111187,'Shelly 
Barlow','IQY53IRM8RK','29-Dec-68',TO_TIMESTAMP('01-Nov-14:21:33','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111188,'Montana 
Brown','ADD82NIS4ZH','01-Jun-81',TO_TIMESTAMP('01-Nov-14:00:24','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111189,'Daniel 
Mendoza','PYJ63MRH9WY','13-May-51',TO_TIMESTAMP('01-Nov-14:05:16','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111190,'Fletcher 
Emerson','FAP89VNR8AE','31-Jul-68',TO_TIMESTAMP('01-Nov-14:10:56','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111191,'Charity 
Edwards','CGG21DPB8TA','20-Jan-90',TO_TIMESTAMP('01-Nov-14:06:07','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111192,'Macy 
Perkins','GTG01DMW8ER','18-Mar-92',TO_TIMESTAMP('01-Nov-14:10:53','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111193,'Mallory 
Maldonado','ZXI64YHQ4MO','20-May-95',TO_TIMESTAMP('01-Nov-14:14:32','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111194,'Edward 
Mcneil','KWH90ZVR5XY','28-Oct-77',TO_TIMESTAMP('01-Nov-14:03:33','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111195,'Reuben 
Kaufman','ZBD53MBV6SI','15-Oct-93',TO_TIMESTAMP('01-Nov-14:15:10','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111196,'Laith 
Delaney','BHE13DIM4MQ','21-Dec-58',TO_TIMESTAMP('01-Nov-14:17:19','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111197,'Wesley 
Witt','DRJ42LCJ1PS','15-Jun-82',TO_TIMESTAMP('01-Nov-14:13:28','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111198,'Rebekah 
Welch','DHS67SXY1EQ','22-Dec-57',TO_TIMESTAMP('01-Nov-14:04:48','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111199,'Colton 
Sampson','IAO43PQL3HB','19-Jan-58',TO_TIMESTAMP('01-Nov-14:20:58','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111200,'Danielle 
Shepherd','PWQ04YRI0AL','01-Apr-78',TO_TIMESTAMP('01-Nov-14:06:42','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111201,'Sage 
Avila','CRF72LLF6VG','12-Feb-59',TO_TIMESTAMP('01-Nov-14:18:56','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111202,'Ezra 
Williamson','HNF16OFU9AB','07-Jul-91',TO_TIMESTAMP('01-Nov-14:01:01','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111203,'Joan 
Townsend','AWK47CGY9SD','27-Feb-97',TO_TIMESTAMP('01-Nov-14:00:05','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111204,'Clare 
Callahan','KLV61VUG3TR','23-Sep-83',TO_TIMESTAMP('01-Nov-14:10:42','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111205,'Lance 
Boyd','WAP87NST7OK','06-Nov-65',TO_TIMESTAMP('01-Nov-14:20:52','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111206,'Zane 
Mcdonald','DKF67BNA7CQ','24-Apr-99',TO_TIMESTAMP('01-Nov-14:11:51','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111207,'Damian 
Guzman','PQL87GFF9FX','10-Jan-81',TO_TIMESTAMP('01-Nov-14:04:15','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111208,'Patience 
David','IEO90UDM2XV','06-Jul-84',TO_TIMESTAMP('01-Nov-14:23:48','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111209,'Eleanor 
Brady','TAJ84EFE5PX','11-Jun-79',TO_TIMESTAMP('01-Nov-14:22:25','DD-MON-RR:HH24:MI'));
INSERT INTO profile (userID,name,password,date_of_birth,lastLogin) VALUES (11111210,'Emery 
Holder','KZG43NBB2MS','03-Jan-86',TO_TIMESTAMP('01-Nov-14:22:38','DD-MON-RR:HH24:MI'));

INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111152,11111153,'09-May-15','dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111159,11111143,'29-Mar-16','interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111142,11111143,'23-Sep-17','quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. 
Pellentesque');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111177,11111208,'25-Nov-14','sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed 
nulla');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111195,11111144,'11-Nov-14','senectus et netus et malesuada fames ac turpis egestas. Aliquam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111129,11111200,'06-Feb-17','adipiscing elit. Etiam laoreet, libero et tristique pellentesque, 
tellus sem');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111197,11111190,'25-Apr-15','Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111206,11111136,'20-Oct-16','ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, 
posuere vulputate,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111134,11111197,'10-Mar-15','dictum placerat, augue. Sed molestie. Sed id risus quis diam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111115,11111199,'19-May-16','Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111175,11111195,'30-Nov-16','eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit 
elit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111178,11111145,'10-Jan-15','Quisque libero lacus, varius et, euismod et, commodo at, libero.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111114,11111155,'03-Oct-16','congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae 
velit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111148,11111190,'22-May-17','ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111137,11111147,'12-Jan-15','ac nulla. In tincidunt congue turpis. In condimentum. Donec at');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111131,11111179,'03-Oct-15','Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111143,11111118,'13-May-16','bibendum. Donec felis orci, adipiscing non, luctus sit amet, 
faucibus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111183,11111176,'14-Jan-15','elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111157,11111157,'03-Nov-15','arcu. Vestibulum ante ipsum primis in faucibus orci luctus et');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111151,11111158,'01-Jun-17','sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum 
sociis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111207,11111194,'04-Nov-16','lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111143,11111151,'28-Dec-14','nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111165,11111202,'28-May-15','Cras eu tellus eu augue porttitor interdum. Sed auctor odio');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111134,11111210,'06-Jun-17','ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor 
scelerisque');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111137,11111158,'22-Apr-15','ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111198,11111191,'17-May-16','dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111174,11111179,'21-May-16','risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111160,11111173,'22-Jan-15','a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111139,11111122,'13-Jun-15','Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero 
mauris,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111196,11111169,'12-Nov-16','Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor 
ullamcorper,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111118,11111113,'08-Oct-16','pretium neque. Morbi quis urna. Nunc quis arcu vel quam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111194,'28-Dec-15','Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111203,11111209,'10-Jun-16','Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat 
placerat velit.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111132,11111139,'25-Sep-16','erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. 
Phasellus nulla.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111191,'03-Dec-15','augue id ante dictum cursus. Nunc mauris elit, dictum eu,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111129,11111162,'24-Jan-15','molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111205,11111131,'18-Oct-16','Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales 
purus,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111206,11111209,'14-Feb-15','augue, eu tempor erat neque non quam. Pellentesque habitant morbi');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111157,11111132,'12-Aug-15','velit eget laoreet posuere, enim nisl elementum purus, accumsan 
interdum');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111115,11111138,'03-Apr-16','non enim. Mauris quis turpis vitae purus gravida sagittis. Duis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111113,11111192,'21-Nov-16','magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim 
tempor');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111138,11111184,'10-Feb-17','ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111140,11111205,'30-Sep-17','per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111115,11111197,'23-Jul-15','tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111170,11111166,'16-Apr-16','quis diam. Pellentesque habitant morbi tristique senectus et netus 
et');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111170,11111168,'02-Feb-17','feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111145,11111210,'23-Jul-17','cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111118,11111206,'04-Jul-17','ac turpis egestas. Fusce aliquet magna a neque. Nullam ut');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111201,11111112,'01-Aug-15','luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. 
Sed');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111142,11111139,'06-Oct-16','mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111116,11111158,'23-Sep-17','nisi sem semper erat, in consectetuer ipsum nunc id enim.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111194,11111191,'22-Jan-16','non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111163,11111204,'01-Nov-16','vitae risus. Duis a mi fringilla mi lacinia mattis. Integer');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111181,11111148,'15-Oct-16','et magnis dis parturient montes, nascetur ridiculus mus. Donec 
dignissim');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111135,11111115,'29-Apr-15','morbi tristique senectus et netus et malesuada fames ac turpis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111122,11111171,'21-Mar-16','nulla. Donec non justo. Proin non massa non ante bibendum');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111208,11111209,'29-Feb-16','dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111121,'21-Jan-17','et magnis dis parturient montes, nascetur ridiculus mus. Proin vel');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111210,11111127,'01-Dec-14','Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. 
Nulla');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111199,11111165,'06-Apr-16','Nulla tincidunt, neque vitae semper egestas, urna justo faucibus 
lectus,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111156,11111130,'05-Sep-17','dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111202,11111203,'15-Apr-16','sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111210,11111116,'23-Jun-16','ipsum porta elit, a feugiat tellus lorem eu metus. In');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111123,11111181,'17-Jun-17','convallis, ante lectus convallis est, vitae sodales nisi magna sed');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111154,11111166,'16-Sep-15','eros turpis non enim. Mauris quis turpis vitae purus gravida');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111184,11111166,'10-Sep-15','magna tellus faucibus leo, in lobortis tellus justo sit amet');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111136,11111138,'27-Mar-17','mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111176,11111132,'08-May-17','Mauris vestibulum, neque sed dictum eleifend, nunc risus varius 
orci,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111125,11111171,'18-Feb-17','ac orci. Ut semper pretium neque. Morbi quis urna. Nunc');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111203,'26-Aug-17','eu augue porttitor interdum. Sed auctor odio a purus. Duis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111179,11111135,'02-Jul-16','dignissim tempor arcu. Vestibulum ut eros non enim commodo 
hendrerit.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111198,11111120,'28-Mar-17','eget nisi dictum augue malesuada malesuada. Integer id magna et');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111117,11111141,'01-Jan-15','auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111128,11111154,'02-Oct-15','facilisis lorem tristique aliquet. Phasellus fermentum convallis 
ligula. Donec luctus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111112,11111174,'20-Jun-16','lobortis tellus justo sit amet nulla. Donec non justo. Proin');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111150,11111126,'16-Apr-15','nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111146,11111159,'01-Oct-16','vel arcu eu odio tristique pharetra. Quisque ac libero nec');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111187,11111169,'16-Mar-16','leo elementum sem, vitae aliquam eros turpis non enim. Mauris');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111194,11111119,'22-Oct-17','ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111187,11111146,'05-Sep-17','aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111182,11111179,'19-Jun-17','nulla at sem molestie sodales. Mauris blandit enim consequat purus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111137,11111208,'23-Jun-15','penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Proin');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111208,11111185,'13-Jan-15','penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Proin');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111144,11111141,'28-Jan-16','arcu. Vestibulum ante ipsum primis in faucibus orci luctus et');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111179,11111187,'30-Jun-17','ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas 
ligula.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111129,11111132,'29-Jun-16','cursus, diam at pretium aliquet, metus urna convallis erat, eget');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111191,11111141,'02-Jul-15','turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111142,'19-Jun-15','enim mi tempor lorem, eget mollis lectus pede et risus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111135,11111207,'18-Feb-16','non, luctus sit amet, faucibus ut, nulla. Cras eu tellus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111170,11111170,'24-Sep-17','Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere 
vulputate, lacus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111178,11111203,'11-May-16','ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111157,11111155,'19-Jun-16','dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer 
adipiscing');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111207,11111205,'20-May-17','mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111174,11111114,'17-Nov-14','ultrices sit amet, risus. Donec nibh enim, gravida sit amet,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111178,'18-Jul-16','aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111132,'07-Dec-15','consectetuer, cursus et, magna. Praesent interdum ligula eu enim. 
Etiam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111122,11111114,'17-Feb-17','molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111171,11111144,'20-Jan-16','ornare, elit elit fermentum risus, at fringilla purus mauris a');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111177,11111176,'10-Oct-16','magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum 
fermentum metus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111183,11111188,'18-Jul-16','ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111186,11111121,'19-May-16','risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111171,'09-Apr-15','In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111126,11111141,'16-Feb-16','accumsan neque et nunc. Quisque ornare tortor at risus. Nunc');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111168,11111141,'20-Sep-17','Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. 
Proin');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111113,11111147,'22-May-17','aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111208,'13-Jul-17','a, auctor non, feugiat nec, diam. Duis mi enim, condimentum');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111158,11111169,'24-Oct-17','id, blandit at, nisi. Cum sociis natoque penatibus et magnis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111205,'08-Oct-15','felis eget varius ultrices, mauris ipsum porta elit, a feugiat');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111114,11111190,'06-Jan-15','et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur 
consequat,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111204,11111154,'20-Jul-16','metus vitae velit egestas lacinia. Sed congue, elit sed consequat');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111123,11111122,'22-Oct-16','eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111147,11111114,'04-Feb-15','Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. 
Mauris');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111168,11111116,'02-Oct-17','nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111129,11111113,'17-Oct-15','sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111205,11111194,'31-Dec-14','tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111168,11111139,'20-Feb-16','sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. 
Pellentesque');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111205,11111152,'04-Apr-17','faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111154,11111207,'18-May-16','per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111121,11111142,'01-Dec-16','iaculis, lacus pede sagittis augue, eu tempor erat neque non');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111192,11111132,'11-Jun-17','dis parturient montes, nascetur ridiculus mus. Aenean eget magna. 
Suspendisse');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111186,11111201,'15-Apr-16','vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111152,11111157,'18-Dec-14','justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor 
vulputate,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111160,11111138,'18-Apr-17','dictum mi, ac mattis velit justo nec ante. Maecenas mi');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111162,11111150,'09-May-16','mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. 
Donec');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111180,11111153,'24-Dec-14','per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111149,11111185,'12-Aug-15','vitae semper egestas, urna justo faucibus lectus, a sollicitudin 
orci');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111196,11111133,'11-Sep-15','tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111193,11111150,'29-Apr-16','ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111123,11111161,'22-Sep-17','dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111129,11111157,'19-Dec-15','facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque 
habitant');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111126,11111179,'19-Jul-17','sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111136,11111127,'03-Aug-15','adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim 
nisl');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111150,11111155,'31-Dec-15','Vestibulum ut eros non enim commodo hendrerit. Donec porttitor 
tellus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111172,11111160,'24-May-15','nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. 
Sed');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111161,11111209,'29-Oct-15','Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111153,11111135,'14-Jun-16','blandit enim consequat purus. Maecenas libero est, congue a, aliquet');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111123,11111162,'07-Jul-15','malesuada malesuada. Integer id magna et ipsum cursus vestibulum. 
Mauris');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111151,'16-Nov-15','eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies 
ligula.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111205,11111121,'13-Feb-16','blandit enim consequat purus. Maecenas libero est, congue a, aliquet');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111210,11111151,'16-Aug-15','primis in faucibus orci luctus et ultrices posuere cubilia Curae;');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111168,11111154,'11-Jun-16','massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, 
velit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111205,'10-Nov-15','venenatis vel, faucibus id, libero. Donec consectetuer mauris id 
sapien.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111115,11111135,'29-Jul-16','amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111139,11111155,'15-Apr-17','malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in 
felis.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111171,11111166,'19-Nov-15','Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. 
Donec');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111167,11111160,'10-Oct-16','Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111202,11111154,'02-Apr-17','auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111116,11111126,'18-Jan-17','cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111207,11111186,'22-Jun-17','at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus 
sit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111181,11111145,'29-Apr-17','at sem molestie sodales. Mauris blandit enim consequat purus. 
Maecenas');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111202,11111116,'24-Apr-16','Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat 
metus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111209,11111144,'16-Apr-15','litora torquent per conubia nostra, per inceptos hymenaeos. Mauris 
ut');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111142,11111177,'18-Aug-17','scelerisque neque sed sem egestas blandit. Nam nulla magna, 
malesuada');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111191,11111188,'20-Sep-15','Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh 
dolor,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111198,11111130,'12-Feb-15','ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111161,11111185,'21-Dec-14','erat semper rutrum. Fusce dolor quam, elementum at, egestas a,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111178,11111188,'26-Mar-16','fermentum metus. Aenean sed pede nec ante blandit viverra. Donec');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111140,'26-Dec-14','bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus 
urna');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111203,11111204,'14-Feb-16','metus. Aenean sed pede nec ante blandit viverra. Donec tempus,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111151,11111171,'07-Jun-16','Nullam feugiat placerat velit. Quisque varius. Nam porttitor 
scelerisque neque.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111164,'01-Jul-15','Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, 
elit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111143,11111172,'23-Jul-15','a odio semper cursus. Integer mollis. Integer tincidunt aliquam 
arcu.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111158,11111153,'07-Nov-15','arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, 
gravida');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111176,11111115,'24-Jan-16','sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed 
nulla');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111165,11111144,'25-Nov-15','auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111124,11111130,'04-Dec-14','Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111149,11111118,'26-Oct-16','mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111153,11111167,'03-Feb-16','ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia 
vitae,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111206,11111170,'04-Feb-17','Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet 
luctus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111118,11111126,'22-Mar-15','nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur 
egestas');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111149,'22-Apr-16','consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111132,11111116,'08-Aug-16','et magnis dis parturient montes, nascetur ridiculus mus. Proin vel');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111201,11111145,'19-Dec-16','amet ante. Vivamus non lorem vitae odio sagittis semper. Nam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111116,11111137,'12-May-17','Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111134,11111165,'29-Dec-14','natoque penatibus et magnis dis parturient montes, nascetur ridiculus 
mus.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111192,11111115,'28-Jan-16','rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111185,11111140,'07-Sep-15','lacus. Nulla tincidunt, neque vitae semper egestas, urna justo 
faucibus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111112,11111145,'21-Feb-15','et tristique pellentesque, tellus sem mollis dui, in sodales elit');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111130,11111172,'12-Oct-16','magna tellus faucibus leo, in lobortis tellus justo sit amet');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111115,11111177,'19-Nov-16','lobortis risus. In mi pede, nonummy ut, molestie in, tempus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111153,11111149,'22-Sep-17','purus. Duis elementum, dui quis accumsan convallis, ante lectus 
convallis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111201,11111172,'08-May-15','molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, 
nisl');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111203,11111125,'11-Sep-17','gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111159,11111118,'17-Oct-17','magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111200,11111165,'06-Mar-17','gravida nunc sed pede. Cum sociis natoque penatibus et magnis');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111135,11111156,'27-Nov-16','cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111209,11111131,'09-Oct-17','est, mollis non, cursus non, egestas a, dui. Cras pellentesque.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111123,11111115,'01-Jun-16','Cum sociis natoque penatibus et magnis dis parturient montes, 
nascetur');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111189,11111208,'10-Dec-14','non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111156,11111132,'05-Jun-16','pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111158,11111196,'24-May-16','et nunc. Quisque ornare tortor at risus. Nunc ac sem');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111146,11111118,'09-Jun-15','porttitor interdum. Sed auctor odio a purus. Duis elementum, dui');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111162,11111129,'25-Jun-16','magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim 
magna');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111111,11111184,'03-Sep-15','blandit mattis. Cras eget nisi dictum augue malesuada malesuada. 
Integer');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111152,11111125,'10-Apr-15','Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In 
ornare');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111173,11111188,'01-Jun-15','dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero 
et');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111194,11111121,'05-Oct-16','sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111156,11111189,'29-Oct-17','augue id ante dictum cursus. Nunc mauris elit, dictum eu,');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111152,11111159,'09-Nov-17','neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu 
turpis.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111174,11111132,'13-Apr-16','pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.');
INSERT INTO friends (userID1,userID2,JDate,message) VALUES (11111152,11111196,'06-Jul-16','dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada');

INSERT INTO groups (gID,name,description) VALUES (0,'Fletchers Group','per conubia nostra, per inceptos hymenaeos.');
INSERT INTO groups (gID,name,description) VALUES (1,'Lilliths Group','semper tellus id nunc interdum feugiat.');
INSERT INTO groups (gID,name,description) VALUES (2,'Adeles Group','vel turpis. Aliquam adipiscing lobortis risus.');
INSERT INTO groups (gID,name,description) VALUES (3,'Sebastians Group','dolor. Fusce mi lorem, vehicula et,');
INSERT INTO groups (gID,name,description) VALUES (4,'Daltons Group','diam lorem, auctor quis, tristique ac,');
INSERT INTO groups (gID,name,description) VALUES (5,'Victors Group','consectetuer euismod est arcu ac orci.');
INSERT INTO groups (gID,name,description) VALUES (6,'Maceys Group','nulla magna, malesuada vel, convallis in,');
INSERT INTO groups (gID,name,description) VALUES (7,'Caldwells Group','iaculis, lacus pede sagittis augue, eu');
INSERT INTO groups (gID,name,description) VALUES (8,'Serenas Group','tincidunt aliquam arcu. Aliquam ultrices iaculis');
INSERT INTO groups (gID,name,description) VALUES (9,'Noahs Group','Integer in magna. Phasellus dolor elit,');
INSERT INTO groups (gID,name,description) VALUES (10,'Wylies Group','lorem semper auctor. Mauris vel turpis.');

INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M963983',11111173,'hey there!',11111209,2,'26-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M922197',11111117,'hey there!',11111189,5,'07-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M322400',11111111,'hey there!',11111128,1,'19-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M832891',11111154,'hey there!',11111196,5,'18-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M403758',11111162,'hey there!',11111164,7,'21-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M110526',11111134,'hey there!',11111159,1,'15-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M425409',11111155,'hey there!',11111179,5,'23-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M291771',11111145,'hey there!',11111147,4,'09-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M942025',11111144,'hey there!',11111200,0,'04-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M245135',11111130,'hey there!',11111139,7,'27-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M140019',11111172,'hey there!',11111149,3,'13-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M425615',11111165,'hey there!',11111179,1,'11-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M573928',11111160,'hey there!',11111128,9,'22-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M071794',11111173,'hey there!',11111178,2,'12-May-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M256294',11111162,'hey there!',11111140,2,'22-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M719875',11111187,'hey there!',11111113,6,'06-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M869991',11111172,'hey there!',11111166,2,'14-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M545084',11111112,'hey there!',11111184,0,'24-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M487272',11111189,'hey there!',11111148,8,'06-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M807266',11111191,'hey there!',11111130,8,'22-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M054042',11111206,'hey there!',11111179,1,'17-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M929144',11111171,'hey there!',11111185,3,'04-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M117765',11111185,'hey there!',11111112,9,'24-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M046216',11111118,'hey there!',11111177,10,'02-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M990412',11111176,'hey there!',11111112,1,'02-Sep-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M097097',11111156,'hey there!',11111186,8,'30-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M854888',11111209,'hey there!',11111129,5,'07-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M233612',11111188,'hey there!',11111129,4,'08-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M787849',11111123,'hey there!',11111204,1,'06-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M652722',11111162,'hey there!',11111130,4,'21-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M325172',11111183,'hey there!',11111162,2,'18-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M494718',11111128,'hey there!',11111184,6,'18-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M671472',11111200,'hey there!',11111199,4,'13-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M645640',11111170,'hey there!',11111205,7,'20-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M079038',11111178,'hey there!',11111153,6,'01-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M792722',11111111,'hey there!',11111194,9,'22-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M947801',11111130,'hey there!',11111162,1,'08-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M415527',11111146,'hey there!',11111154,7,'15-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M191345',11111199,'hey there!',11111129,7,'19-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M291675',11111140,'hey there!',11111167,6,'05-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M016433',11111128,'hey there!',11111120,2,'12-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M255626',11111131,'hey there!',11111156,2,'17-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M991380',11111176,'hey there!',11111186,1,'25-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M186683',11111149,'hey there!',11111135,3,'17-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M160899',11111143,'hey there!',11111157,9,'09-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M179481',11111171,'hey there!',11111147,8,'16-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M353950',11111204,'hey there!',11111156,10,'01-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M305913',11111158,'hey there!',11111139,4,'03-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M055914',11111209,'hey there!',11111154,5,'15-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M955281',11111192,'hey there!',11111166,0,'18-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M787071',11111160,'hey there!',11111165,7,'09-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M018250',11111173,'hey there!',11111141,1,'15-Jan-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M917058',11111199,'hey there!',11111163,3,'12-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M254530',11111209,'hey there!',11111147,10,'05-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M185463',11111165,'hey there!',11111146,7,'17-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M539323',11111121,'hey there!',11111119,7,'21-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M809901',11111206,'hey there!',11111159,0,'01-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M545199',11111133,'hey there!',11111112,8,'25-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M395594',11111111,'hey there!',11111143,0,'15-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M510913',11111193,'hey there!',11111154,9,'24-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M521947',11111172,'hey there!',11111135,2,'07-Jul-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M161770',11111120,'hey there!',11111205,6,'07-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M378973',11111204,'hey there!',11111125,5,'07-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M258493',11111128,'hey there!',11111116,1,'20-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M641615',11111191,'hey there!',11111116,4,'25-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M752649',11111149,'hey there!',11111150,6,'17-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M102183',11111181,'hey there!',11111200,6,'24-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M613510',11111124,'hey there!',11111113,6,'11-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M154713',11111122,'hey there!',11111146,2,'27-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M671510',11111124,'hey there!',11111203,2,'27-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M409668',11111130,'hey there!',11111204,0,'22-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M616664',11111198,'hey there!',11111143,8,'27-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M733568',11111173,'hey there!',11111116,1,'19-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M682009',11111206,'hey there!',11111178,0,'19-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M512989',11111203,'hey there!',11111120,1,'09-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M883763',11111198,'hey there!',11111186,7,'26-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M967146',11111202,'hey there!',11111151,9,'03-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M095592',11111210,'hey there!',11111204,1,'18-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M053939',11111156,'hey there!',11111141,7,'02-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M103748',11111178,'hey there!',11111169,7,'20-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M175072',11111161,'hey there!',11111193,8,'05-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M916418',11111184,'hey there!',11111118,6,'21-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M228257',11111122,'hey there!',11111166,8,'14-Jul-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M212509',11111210,'hey there!',11111154,9,'30-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M560365',11111187,'hey there!',11111143,4,'02-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M796121',11111196,'hey there!',11111118,6,'22-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M502240',11111134,'hey there!',11111209,10,'15-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M373594',11111142,'hey there!',11111168,6,'09-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M476500',11111145,'hey there!',11111154,7,'11-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M031759',11111130,'hey there!',11111155,8,'12-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M281047',11111190,'hey there!',11111173,1,'20-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M410784',11111124,'hey there!',11111127,10,'26-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M718307',11111164,'hey there!',11111172,6,'04-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M883246',11111176,'hey there!',11111146,5,'07-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M650402',11111187,'hey there!',11111140,5,'03-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M796908',11111156,'hey there!',11111203,4,'16-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M896487',11111188,'hey there!',11111143,8,'29-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M332543',11111168,'hey there!',11111143,9,'07-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M805361',11111184,'hey there!',11111125,6,'03-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M265973',11111180,'hey there!',11111115,2,'15-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M867038',11111144,'hey there!',11111156,4,'24-Nov-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M751229',11111201,'hey there!',11111148,8,'07-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M251218',11111142,'hey there!',11111193,8,'01-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M622851',11111159,'hey there!',11111135,9,'28-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M071043',11111191,'hey there!',11111119,3,'21-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M522093',11111112,'hey there!',11111210,7,'07-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M011877',11111155,'hey there!',11111179,10,'07-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M421304',11111161,'hey there!',11111118,7,'19-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M295347',11111188,'hey there!',11111205,3,'24-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M282274',11111145,'hey there!',11111198,2,'18-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M838970',11111152,'hey there!',11111210,9,'06-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M855457',11111111,'hey there!',11111186,10,'10-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M600391',11111151,'hey there!',11111192,7,'04-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M761467',11111191,'hey there!',11111150,9,'06-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M256597',11111207,'hey there!',11111145,7,'31-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M288307',11111183,'hey there!',11111195,4,'23-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M493692',11111143,'hey there!',11111204,5,'07-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M786112',11111206,'hey there!',11111195,8,'27-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M440179',11111121,'hey there!',11111127,0,'06-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M793193',11111149,'hey there!',11111126,1,'15-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M563216',11111177,'hey there!',11111147,7,'30-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M042787',11111114,'hey there!',11111195,0,'20-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M098765',11111170,'hey there!',11111124,0,'18-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M665586',11111198,'hey there!',11111196,8,'12-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M204106',11111126,'hey there!',11111193,3,'26-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M076477',11111141,'hey there!',11111142,8,'07-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M561858',11111201,'hey there!',11111192,4,'08-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M239163',11111145,'hey there!',11111147,2,'16-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M116067',11111183,'hey there!',11111111,3,'19-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M053029',11111161,'hey there!',11111137,3,'24-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M754626',11111174,'hey there!',11111185,5,'30-Jul-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M345382',11111179,'hey there!',11111143,7,'06-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M697034',11111194,'hey there!',11111197,0,'31-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M781028',11111145,'hey there!',11111170,4,'08-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M331296',11111156,'hey there!',11111130,2,'11-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M449975',11111191,'hey there!',11111150,7,'29-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M130962',11111114,'hey there!',11111131,6,'24-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M616977',11111152,'hey there!',11111185,7,'25-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M855290',11111142,'hey there!',11111206,5,'09-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M233212',11111167,'hey there!',11111210,0,'03-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M945105',11111125,'hey there!',11111178,7,'29-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M664969',11111198,'hey there!',11111141,10,'18-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M048721',11111112,'hey there!',11111184,2,'24-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M579135',11111201,'hey there!',11111179,2,'06-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M628368',11111190,'hey there!',11111133,0,'11-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M502454',11111179,'hey there!',11111147,8,'03-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M035817',11111187,'hey there!',11111176,9,'10-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M791986',11111153,'hey there!',11111180,9,'16-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M808713',11111186,'hey there!',11111121,3,'09-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M076834',11111164,'hey there!',11111162,5,'19-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M601164',11111186,'hey there!',11111138,2,'16-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M311160',11111136,'hey there!',11111160,8,'16-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M772833',11111187,'hey there!',11111160,7,'03-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M245920',11111153,'hey there!',11111168,1,'24-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M999066',11111153,'hey there!',11111163,3,'05-Nov-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M647240',11111179,'hey there!',11111163,10,'18-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M071450',11111144,'hey there!',11111121,0,'07-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M259833',11111182,'hey there!',11111174,7,'20-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M853010',11111131,'hey there!',11111116,1,'29-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M598432',11111142,'hey there!',11111138,5,'16-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M690996',11111147,'hey there!',11111177,4,'18-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M470035',11111200,'hey there!',11111166,3,'03-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M806736',11111115,'hey there!',11111139,10,'02-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M854231',11111208,'hey there!',11111167,9,'28-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M839200',11111138,'hey there!',11111194,10,'19-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M129328',11111191,'hey there!',11111194,2,'25-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M868793',11111185,'hey there!',11111182,1,'03-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M204100',11111153,'hey there!',11111153,3,'18-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M228845',11111125,'hey there!',11111152,1,'14-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M337529',11111112,'hey there!',11111188,0,'29-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M191642',11111207,'hey there!',11111184,6,'10-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M207287',11111176,'hey there!',11111123,9,'22-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M493461',11111152,'hey there!',11111112,9,'27-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M262629',11111150,'hey there!',11111178,7,'04-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M904134',11111188,'hey there!',11111188,0,'06-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M405383',11111191,'hey there!',11111201,1,'18-Sep-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M602460',11111111,'hey there!',11111195,9,'30-May-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M569100',11111131,'hey there!',11111168,9,'24-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M310833',11111120,'hey there!',11111175,1,'09-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M903919',11111182,'hey there!',11111206,1,'28-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M502968',11111142,'hey there!',11111179,4,'28-Nov-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M521250',11111118,'hey there!',11111207,1,'11-May-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M030554',11111210,'hey there!',11111170,5,'06-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M337230',11111168,'hey there!',11111159,8,'25-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M523424',11111147,'hey there!',11111202,0,'10-Jan-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M864561',11111178,'hey there!',11111137,5,'02-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M945117',11111133,'hey there!',11111134,10,'04-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M271581',11111114,'hey there!',11111184,7,'28-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M273212',11111195,'hey there!',11111169,4,'19-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M307373',11111173,'hey there!',11111128,8,'13-May-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M491843',11111187,'hey there!',11111166,5,'21-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M292744',11111112,'hey there!',11111119,2,'25-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M713287',11111135,'hey there!',11111140,6,'09-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M835804',11111115,'hey there!',11111122,1,'19-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M705698',11111177,'hey there!',11111173,4,'30-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M187405',11111128,'hey there!',11111148,8,'14-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M549759',11111196,'hey there!',11111137,5,'01-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M719390',11111151,'hey there!',11111131,2,'02-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M385924',11111122,'hey there!',11111166,7,'17-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M715535',11111124,'hey there!',11111159,4,'12-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M021644',11111181,'hey there!',11111198,1,'20-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M588311',11111182,'hey there!',11111208,3,'09-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M769356',11111186,'hey there!',11111111,3,'01-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M677145',11111178,'hey there!',11111130,8,'22-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M331355',11111138,'hey there!',11111199,10,'01-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M347741',11111124,'hey there!',11111114,2,'07-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M739970',11111174,'hey there!',11111140,0,'06-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M587685',11111140,'hey there!',11111157,2,'14-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M141005',11111138,'hey there!',11111158,1,'27-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M937577',11111206,'hey there!',11111175,1,'28-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M272632',11111173,'hey there!',11111177,1,'03-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M318089',11111169,'hey there!',11111133,7,'24-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M752434',11111175,'hey there!',11111204,9,'06-Sep-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M502559',11111130,'hey there!',11111130,4,'28-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M601315',11111148,'hey there!',11111140,6,'07-Jun-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M005471',11111195,'hey there!',11111157,3,'29-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M503610',11111119,'hey there!',11111126,0,'27-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M918554',11111147,'hey there!',11111196,9,'17-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M914099',11111120,'hey there!',11111202,0,'25-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M369995',11111175,'hey there!',11111125,0,'28-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M430719',11111128,'hey there!',11111172,4,'25-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M541381',11111148,'hey there!',11111157,1,'03-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M595783',11111190,'hey there!',11111156,10,'26-Nov-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M256116',11111152,'hey there!',11111167,8,'14-Aug-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M736102',11111205,'hey there!',11111138,2,'26-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M075549',11111189,'hey there!',11111204,1,'25-Jun-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M491077',11111199,'hey there!',11111194,7,'05-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M187834',11111205,'hey there!',11111150,5,'25-Jan-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M585604',11111119,'hey there!',11111121,10,'16-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M059797',11111125,'hey there!',11111181,5,'18-Sep-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M894749',11111171,'hey there!',11111153,5,'29-Jan-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M060114',11111164,'hey there!',11111174,7,'01-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M368810',11111113,'hey there!',11111119,1,'18-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M159035',11111152,'hey there!',11111130,6,'06-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M305120',11111157,'hey there!',11111191,3,'30-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M588033',11111210,'hey there!',11111117,6,'05-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M359532',11111164,'hey there!',11111168,5,'04-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M781518',11111149,'hey there!',11111136,5,'20-Nov-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M525003',11111120,'hey there!',11111166,3,'08-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M506605',11111146,'hey there!',11111174,6,'17-Sep-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M756585',11111123,'hey there!',11111176,5,'04-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M541609',11111119,'hey there!',11111156,9,'27-Dec-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M341871',11111145,'hey there!',11111125,8,'27-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M946005',11111122,'hey there!',11111170,8,'15-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M561600',11111127,'hey there!',11111187,3,'11-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M210770',11111157,'hey there!',11111186,3,'08-Jul-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M947713',11111162,'hey there!',11111135,7,'09-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M216621',11111177,'hey there!',11111179,2,'21-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M539257',11111192,'hey there!',11111205,2,'06-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M207252',11111133,'hey there!',11111148,0,'15-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M686545',11111139,'hey there!',11111124,0,'18-May-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M538321',11111200,'hey there!',11111141,3,'09-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M508454',11111186,'hey there!',11111151,0,'09-Dec-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M135725',11111195,'hey there!',11111158,5,'24-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M380347',11111164,'hey there!',11111126,5,'21-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M871076',11111126,'hey there!',11111206,5,'16-Feb-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M100196',11111133,'hey there!',11111172,8,'26-Mar-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M404395',11111197,'hey there!',11111154,8,'09-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M798755',11111202,'hey there!',11111124,3,'04-Jun-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M671442',11111115,'hey there!',11111113,2,'23-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M739068',11111158,'hey there!',11111135,1,'17-Apr-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M320183',11111169,'hey there!',11111207,7,'13-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M790149',11111115,'hey there!',11111129,10,'15-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M787277',11111113,'hey there!',11111181,9,'27-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M073087',11111160,'hey there!',11111207,7,'03-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M332500',11111117,'hey there!',11111167,2,'21-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M941038',11111134,'hey there!',11111202,2,'01-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M041528',11111192,'hey there!',11111189,9,'09-Jan-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M524878',11111112,'hey there!',11111143,1,'16-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M657549',11111160,'hey there!',11111193,6,'01-Oct-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M579058',11111197,'hey there!',11111210,6,'13-Feb-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M129190',11111158,'hey there!',11111115,6,'25-May-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M945136',11111184,'hey there!',11111114,8,'12-Oct-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M092337',11111130,'hey there!',11111171,0,'17-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M060704',11111157,'hey there!',11111138,6,'07-Jul-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M128520',11111146,'hey there!',11111197,8,'29-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M607109',11111135,'hey there!',11111173,5,'20-Sep-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M146640',11111203,'hey there!',11111132,6,'24-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M367899',11111111,'hey there!',11111205,7,'16-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M040319',11111189,'hey there!',11111139,2,'06-Sep-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M376489',11111159,'hey there!',11111120,10,'14-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M380539',11111197,'hey there!',11111156,6,'19-Nov-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M327201',11111140,'hey there!',11111185,5,'03-Mar-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M103623',11111176,'hey there!',11111164,3,'19-Nov-14');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M391972',11111155,'hey there!',11111172,1,'20-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M314428',11111198,'hey there!',11111139,0,'06-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M424989',11111170,'hey there!',11111180,2,'08-Jul-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M047573',11111112,'hey there!',11111121,9,'01-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M287098',11111168,'hey there!',11111162,7,'21-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M326186',11111200,'hey there!',11111111,10,'29-May-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M220936',11111157,'hey there!',11111145,4,'18-Dec-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M907967',11111196,'hey there!',11111125,5,'18-Nov-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M447565',11111146,'hey there!',11111208,10,'28-Aug-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M768927',11111146,'hey there!',11111168,7,'02-Apr-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M161505',11111176,'hey there!',11111182,5,'04-Mar-15');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M829191',11111201,'hey there!',11111163,8,'07-Feb-17');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M207113',11111208,'hey there!',11111161,7,'28-Oct-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M680785',11111143,'hey there!',11111151,5,'04-Apr-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M733415',11111154,'hey there!',11111132,6,'10-Aug-16');
INSERT INTO messages (msgID,fromID,message,toUserID,toGroupID,dateSent) VALUES ('M521921',11111185,'hey there!',11111138,2,'14-Jun-15');

INSERT INTO messageRecipient (msgID,userID) VALUES ('M963983',11111209);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M922197',11111189);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M322400',11111128);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M832891',11111196);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M403758',11111164);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M110526', 11111159);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M425409',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M291771',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M942025',11111200);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M245135', 11111139);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M140019', 11111149);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M425615',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M573928',11111128);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M071794',11111178);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M256294',11111140);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M719875',11111113);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M869991',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M545084’,11111184);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M487272',11111148);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M807266’,11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M054042',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M929144',,11111185);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M117765',,11111112);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M046216',,11111177);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M990412',,11111112);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M097097',11111186);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M854888',11111129);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M233612',11111129);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M787849',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M652722',11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M325172',11111162);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M494718',11111184);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M671472',11111199);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M645640',11111205);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M079038',11111153);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M792722',11111194);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M947801',11111162);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M415527',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M191345',11111129);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M291675',11111167);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M016433',11111120);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M255626',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M991380',11111186);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M186683',11111135);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M160899',11111157);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M179481',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M353950',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M305913',11111139);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M055914',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M955281',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M787071',11111165);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M018250',11111141);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M917058',11111163);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M254530',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M185463',11111146);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M539323',11111119);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M809901',11111159);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M545199',11111112);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M395594',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M510913',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M521947',11111135);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M161770',11111205);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M378973',11111125);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M258493',11111116);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M641615',11111116);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M752649',11111150);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M102183',11111200);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M613510',11111113);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M154713',11111146);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M671510',11111203);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M409668',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M616664',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M733568',11111116);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M682009',11111178);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M512989',11111120);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M883763',11111186);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M967146',11111151);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M095592',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M053939',11111141);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M103748',11111169);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M175072',11111193);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M916418',11111118);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M228257',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M212509',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M560365',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M796121',11111118);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M502240',11111209);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M373594',11111168);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M476500',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M031759',11111155);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M281047',11111173);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M410784',11111127);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M718307',11111172);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M883246',11111146);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M650402',11111140);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M796908',11111203);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M896487',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M332543',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M805361',11111125);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M265973',11111115);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M867038',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M751229',11111148);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M251218',11111193);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M622851',11111135);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M071043',11111119);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M522093',11111210);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M011877',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M421304',11111118);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M295347',11111205);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M282274',11111198);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M838970',11111210);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M855457',11111186);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M600391',11111192);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M761467',11111150);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M256597',11111145);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M288307',11111195);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M493692',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M786112',11111195);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M440179',11111127);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M793193',11111126);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M563216',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M042787',11111195);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M098765',11111124);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M665586',11111196);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M204106',11111193);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M076477',11111142);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M561858',11111192);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M239163',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M116067',11111111);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M053029',11111137);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M754626',11111185);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M345382',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M697034',11111197);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M781028',11111170);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M331296',11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M449975',11111150);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M130962',11111131);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M616977',11111185);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M855290',11111206);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M233212',11111210);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M945105',11111178);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M664969',11111141);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M048721',11111184);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M579135',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M628368',11111133);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M502454',11111147);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M035817',11111176);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M791986',11111180);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M808713',11111121);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M076834',11111162);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M601164',11111138);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M311160',11111160);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M772833',11111160);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M245920',11111168);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M999066',11111163);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M647240',11111163);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M071450',11111121);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M259833',11111174);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M853010',11111116);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M598432',11111138);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M690996',11111177);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M470035',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M806736',11111139);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M854231',11111167);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M839200',11111194);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M129328',11111194);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M868793',11111182);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M204100',11111153);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M228845',11111152);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M337529',11111188);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M191642',11111184);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M207287',11111123);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M493461',11111112);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M262629',11111178);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M904134',11111188);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M405383',11111201);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M602460',11111195);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M569100',11111168);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M310833',11111175);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M903919',11111206);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M502968',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M521250',11111207);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M030554',11111170);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M337230',11111159);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M523424',11111202);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M864561',11111137);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M945117',11111134);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M271581',11111184);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M273212',11111169);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M307373',11111128);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M491843',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M292744',11111119);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M713287',11111140);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M835804',11111122);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M705698',11111173);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M187405',11111148);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M549759',11111137);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M719390',11111131);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M385924',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M715535',11111159);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M021644',11111198);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M588311',11111208);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M769356',11111111);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M677145',11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M331355',11111199);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M347741',11111114);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M739970',11111140);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M587685',11111157);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M141005',11111158);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M937577',11111175);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M272632',11111177);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M318089',11111133);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M752434',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M502559',11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M601315',11111140);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M005471',11111157);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M503610',11111126);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M918554',11111196);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M914099',11111202);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M369995',11111125);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M430719',11111172);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M541381',11111157);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M595783',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M256116',11111167);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M736102',11111138);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M075549',11111204);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M491077',11111194);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M187834',11111150);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M585604',11111121);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M059797',11111181);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M894749',11111153);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M060114',11111174);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M368810',11111119);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M159035',11111130);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M305120',11111191);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M588033',11111117);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M359532',11111168);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M781518',11111136);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M525003',11111166);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M506605',11111174);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M756585',11111176);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M541609',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M341871',11111125);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M946005',11111170);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M561600',11111187);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M210770',11111186);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M947713',11111135);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M216621',11111179);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M539257',11111205);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M207252',11111148);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M686545',11111124);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M538321',11111141);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M508454',11111151);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M135725',11111158);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M380347',11111126);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M871076',11111206);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M100196',11111172);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M404395',11111154);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M798755',11111124);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M671442',11111113);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M739068',11111135);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M320183',11111207);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M790149',11111129);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M787277',11111181);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M073087',11111207);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M332500',11111167);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M941038',11111202);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M041528',11111189);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M524878',11111143);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M657549',11111193);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M579058',11111210);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M129190',11111115);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M945136',11111114);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M092337',11111171);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M060704',11111138);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M128520',11111197);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M607109',11111173);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M146640',11111132);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M367899',11111205);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M040319',11111139);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M376489',11111120);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M380539',11111156);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M327201',11111185);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M103623',11111164);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M391972',11111172);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M314428',11111139);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M424989',11111180);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M047573',11111121);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M287098',11111162);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M326186',11111111);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M220936',11111145);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M907967',11111125);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M447565',11111208);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M768927',11111168);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M161505',11111182);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M829191',11111163);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M207113',11111161);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M680785',11111151);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M733415',11111132);
INSERT INTO messageRecipient (msgID,userID) VALUES ('M521921',11111138);
>>>>>>> ca21ab847c79e3303a4b650017f2dac15d22018e
