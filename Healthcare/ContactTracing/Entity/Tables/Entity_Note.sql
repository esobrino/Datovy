CREATE TABLE [Core].[Entity_Note]
(
   [Entity_ID]             VARCHAR(30) NOT NULL,
   [Entity_Type_ID]        VARCHAR(30) NOT NULL,

   [Note_ID]               VARCHAR(30) PRIMARY KEY,
   [Note_Type_ID]          VARCHAR(30) NULL,
   [Note_Text]             VARCHAR(4096) NOT NULL,
   [Note_DateTime]         DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Author_ID]             VARCHAR(30),
   [Author_Role_ID]        VARCHAR(30),
   [Author_Name]           VARCHAR(80),

   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT FK_Entity_Note_Type FOREIGN KEY ([Note_Type_ID])
      REFERENCES Entity.Entity_Note_Type(Type_ID)
)
