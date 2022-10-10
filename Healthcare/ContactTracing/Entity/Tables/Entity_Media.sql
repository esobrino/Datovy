CREATE TABLE [Core].[Entity_Media]
(
	[Entity_ID]               VARCHAR(30) NOT NULL,
   [Media_ID]                VARCHAR(30) PRIMARY KEY,
   [Alternate_ID]            VARCHAR(60) NULL,
   [Type_ID]                 VARCHAR(30) NULL,
   [Category_Text]           VARCHAR(80),
   [Status_Code]             INT NOT NULL DEFAULT 0,
   [Url_Text]                VARCHAR(1024),
   [Size_In_Bytes]           INTEGER NOT NULL DEFAULT 0,
   [Media_Data]              VARBINARY(MAX) NULL,
   [Scope_Code_ID]           VARCHAR(30) NULL,
   [Content_Type_Code_ID]    VARCHAR(30) NULL,
   [Content_Type_Text]       VARCHAR(128) NOT NULL DEFAULT '',
   [Media_Default_Indicator] BIT NOT NULL DEFAULT 0,
   [Serial_No]               BIGINT NOT NULL DEFAULT 0,

   [Status_Code_ID]          VARCHAR (30)  NULL,
   [Status_DateTime]         DATETIMEOFFSET   NULL,
   [Start_DateTime]          DATETIMEOFFSET   NULL,
   [End_DateTime]            DATETIMEOFFSET   NULL,
 
   [Reference_Date_Type_ID]  VARCHAR(30) NULL,
   [Reference_DateTime]      DATETIMEOFFSET NULL,

   [Tenant_ID]               VARCHAR(30) NOT NULL,
   [Data_Owner_ID]           VARCHAR(30) NULL,
   [Agency_Reporting_ID]     VARCHAR(30) NULL,
   [Version_Number]          VARCHAR(20),
   [Sequence_Number]         INTEGER NULL,
   [Created_DateTime]        DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]   DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]   CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]      VARCHAR(40),

   CONSTRAINT FK_Entity_Media_Type FOREIGN KEY ([Type_ID])
      REFERENCES Entity.Entity_Media_Type(Type_ID)
)
GO
