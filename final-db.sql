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
	CONSTRAINT pk_friends PRIMARY KEY(userID1, userID2) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_friends_userID1 FOREIGN KEY(userID1) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_friends_userID2 FOREIGN KEY(userID2) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE pendingFriends (
	fromID  varchar2(20),
	toID    varchar2(20),
	message varchar2(200) DEFAULT NULL,
	CONSTRAINT pk_pending_friends PRIMARY KEY(fromID, toID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingFriends_fromID FOREIGN KEY(fromID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingFriends_toID FOREIGN KEY(toID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
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
	dateSent  date          NOT NULL,
	CONSTRAINT pk_messages PRIMARY KEY(msgID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_fromID FOREIGN KEY(fromID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_toUserID FOREIGN KEY(toUserID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_messages_toGroupID FOREIGN KEY(toGroupID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT ic_messages1 CHECK(toUserID IS NOT NULL OR toGroupID IS NOT NULL) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT ic_messages2 CHECK((toUserID IS NOT NULL AND toGroupID IS NULL) OR (toUserID IS NULL AND toGroupID IS NOT NULL))  DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE messageRecipient (
	msgID  varchar2(20),
	userID varchar2(20),
	CONSTRAINT pk_messageRecipient PRIMARY KEY(msgID, userID) DEFERABLE INITIALLY IMEDIATE,
	--NOTE: I used both msgID and userID for the pk in case one message could be sent to multiple people via a group
	CONSTRAINT fk_messageRecipient_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE groupMembership (
	gID   varchar2(20),
	userID varchar2(20),
	role   varchar2(20) DEFAULT 'member', --assuming this is the default vaule for role
	CONSTRAINT pk_groupMembership PRIMARY KEY(gID, userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_groupMembership_gID FOREIGN KEY(gID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_groupMembership_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
);

CREATE TABLE pendingGroupMembers (
	gID      varchar2(20),
	userID  varchar2(20),
	message varchar2(200) DEFAULT NULL,
	CONSTRAINT pk_pendingGroupMembers PRIMARY KEY(gID, userID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingGroupMembers_gID FOREIGN KEY(gID) REFERENCES groups(gID) DEFERABLE INITIALLY IMEDIATE,
	CONSTRAINT fk_pendingGroupMembers_userID FOREIGN KEY(userID) REFERENCES profile(userID) DEFERABLE INITIALLY IMEDIATE
);