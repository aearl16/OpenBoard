CREATE DATABASE OpenBoard;

#Make sure correct db is used
use OpenBoard;

#User Table
CREATE TABLE IF NOT EXISTS OBUser 
(
    ID INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(256),
    UserRole INT NOT NULL,
    PRIMARY KEY (ID)
);

#Begin board items section
#Worklog for tasks
CREATE TABLE IF NOT EXISTS Worklog
(
    LogID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (LogID)
);

#Task table
CREATE TABLE IF NOT EXISTS Task
(
    TaskID INT NOT NULL AUTO_INCREMENT,
    LogID INT,
    Title VARCHAR (256),
    TaskDescription VARCHAR(256),
    PRIMARY KEY (TaskID),
    FOREIGN KEY (LogID) REFERENCES Worklog(LogID)
);

#Story Table
CREATE TABLE IF NOT EXISTS Story
(
    StoryID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(256) NOT NULL,
    StoryDescription VARCHAR(256) NOT NULL,
    CreationDate DATE NOT NULL,
    PRIMARY KEY (StoryID)
);

#Feature Table
CREATE TABLE IF NOT EXISTS Feature
(
    FeatureID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(256) NOT NULL,
    FeatureDescription VARCHAR(256) NOT NULL,
    AcceptanceCriteria VARCHAR(256) NOT NULL,
    Size INT,
    PriorityValue INT NOT NULL,
    PRIMARY KEY (FeatureID)
);

#Epic Table
CREATE TABLE IF NOT EXISTS Epic
(
    EpicID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(256) NOT NULL,
    EpicDescription VARCHAR(256) NOT NULL,
    PRIMARY KEY (EpicID)
);

#Sprint Table
CREATE TABLE IF NOT EXISTS Sprint
(
    SprintID INT NOT NULL AUTO_INCREMENT,
    TaskID INT,
    CreationDate DATE NOT NULL,
    StartDate DATETIME,
    EndDate DATETIME,
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (SprintID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);

#Product Backlog Table, backlog associated with a sprint
CREATE TABLE IF NOT EXISTS Backlog
(
    BacklogID INT NOT NULL AUTO_INCREMENT,
    CreationDate DATETIME NOT NULL,
    SprintID INT,
    PRIMARY KEY (BacklogID)
);

#Scrum Board Table
CREATE TABLE IF NOT EXISTS ScrumBoard
(
    BoardID INT NOT NULL AUTO_INCREMENT,
    BacklogID INT,
    CreationDate DATE NOT NULL,
    PRIMARY KEY(BoardID),
    FOREIGN KEY (BacklogID) REFERENCES Backlog(BacklogID)
);

#Valid Users Table, lists the users that have valid access to a board
#These entries have to be assigned by the sys admin
CREATE TABLE IF NOT EXISTS ValidUsers
(
    UserID INT NOT NULL,
    BoardID INT NOT NULL,
    PRIMARY KEY (UserID, BoardID)
);

#LogItem Table
#User ID Is Now Entered During Creation
CREATE TABLE LogItem 
(
    EntryItemID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    Title VARCHAR(256) NOT NULL,
    WorkDescription VARCHAR(256) NOT NULL,
    WorkHours INT NOT NULL,
    DateCreated DATE NOT NULL,
    PRIMARY KEY (EntryItemID)
);

#WorklogEntries Table
CREATE TABLE IF NOT EXISTS WorklogEntries
(
    LogID INT NOT NULL,
    EntryItemID INT NOT NULL,
    PRIMARY KEY (LogID, EntryItemID),
    FOREIGN KEY (LogID) REFERENCES Worklog(LogID),
    FOREIGN KEY (EntryItemID) REFERENCES LogItem(EntryItemID)
);

#SprintTasks Table
CREATE TABLE IF NOT EXISTS SprintTasks
(
    TaskID INT NOT NULL,
    SprintID INT NOT NULL,
    PRIMARY KEY (TaskID, SprintID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID)
);

#WorkAssigned table, this one was missing from my ERD,
#it keeps track of tasks assigned to users
#assigned either by the user or the sys admin
CREATE TABLE IF NOT EXISTS WorkAssigned
(
    UserID INT NOT NULL,
    TaskID INT NOT NULL,
    PRIMARY KEY (UserID, TaskID)
);

#BacklogEpics Table
CREATE TABLE IF NOT EXISTS BacklogEpics
(
    EpicID INT NOT NULL,
    BacklogID INT NOT NULL,
    PRIMARY KEY (EpicID),
    FOREIGN KEY (EpicID) REFERENCES Epic(EpicID),
    FOREIGN KEY (BacklogID) REFERENCES Backlog(BacklogID)
);

#EpicFeatures Table
CREATE TABLE IF NOT EXISTS EpicFeatures
(
    FeatureID INT NOT NULL,
    EpicID INT NOT NULL,
    PRIMARY KEY (FeatureID, EpicID),
    FOREIGN KEY (FeatureID) REFERENCES Feature(FeatureID),
    FOREIGN KEY (EpicID) REFERENCES Epic(EpicID)
);

#FeatureStories Table
CREATE TABLE IF NOT EXISTS FeatureStories
(
    StoryID INT NOT NULL,
    FeatureID INT NOT NULL,
    PRIMARY KEY (StoryID, FeatureID),
    FOREIGN KEY (StoryID) REFERENCES Story(StoryID),
    FOREIGN KEY (FeatureID) REFERENCES Feature(FeatureID)
);

#StoryTasks Table
CREATE TABLE IF NOT EXISTS StoryTasks
(
    TaskID INT NOT NULL,
    StoryID INT NOT NULL,
    PRIMARY KEY (TaskID, StoryID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    FOREIGN KEY (StoryID) REFERENCES Story(StoryID)
);

#Begin assumed Sprint Board, all committed items
#assumed to be part of the sprint backlog
#CommittedTasks Table
CREATE TABLE IF NOT EXISTS CommittedTasks
(
    SprintID INT NOT NULL,
    TaskID INT NOT NULL,
    PRIMARY KEY (SprintID, TaskID),
    FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);

#InProgress Table
CREATE TABLE IF NOT EXISTS InProgress
(
    SprintID INT NOT NULL,
    TaskID INT NOT NULL,
    PRIMARY KEY (SprintID, TaskID),
    FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);

#Finished Table
CREATE TABLE IF NOT EXISTS Finished
(
    SprintID INT NOT NULL,
    TaskID INT NOT NULL,
    PRIMARY KEY (SprintID, TaskID),
    FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);