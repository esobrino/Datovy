CREATE TABLE [Core].[Note]
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

   -- record management
   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Start_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [End_DateTime]          DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL,

   CONSTRAINT FK_Note_Type FOREIGN KEY ([Note_Type_ID])
      REFERENCES Core.Note_Type(Type_ID)
)
