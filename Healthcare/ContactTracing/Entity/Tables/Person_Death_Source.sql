CREATE TABLE [Core].[Person_Death_Source] (
   [Death_Source_ID]       VARCHAR(30)  NOT NULL,
   [Person_ID]             VARCHAR(30)  NULL,
   [Source_Text]           VARCHAR(256) NULL,
   [Death_Date]            DATETIME2(7) NULL,
   [Death_DateTime]        DATETIMEOFFSET NULL,
   [Death_Date_Text]       VARCHAR(50)  NULL,
   [CauseCodeID]           VARCHAR(30)  NULL,
    
   [Status_Code_ID]        VARCHAR (30)  NULL,
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

   CONSTRAINT [PK_Person_Death_Source] PRIMARY KEY CLUSTERED ([Death_Source_ID] ASC),
   CONSTRAINT [FK_Person_Death_Source] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);


