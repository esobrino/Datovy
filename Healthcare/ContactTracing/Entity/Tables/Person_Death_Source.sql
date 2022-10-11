CREATE TABLE [Entity].[Person_Death_Source] (
   [Death_Source_ID]       VARCHAR(30) NOT NULL,
   [Person_ID]             VARCHAR(30) NULL,
   [Source_Text]           VARCHAR(256) NULL,
   [Death_Date]            DATETIME2(7) NULL,
   [Death_DateTime]        DATETIMEOFFSET NULL,
   [Death_Date_Text]       VARCHAR(50) NULL,
   [Cause_Code_ID]         VARCHAR(30) NULL,

   [Status_Code_ID]        VARCHAR(30) NULL,
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

   CONSTRAINT [PK_Person_Death_Source] PRIMARY KEY CLUSTERED ([Death_Source_ID] ASC),
   CONSTRAINT [FK_Person_Death_Source] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);


