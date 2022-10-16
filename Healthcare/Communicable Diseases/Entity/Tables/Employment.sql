CREATE TABLE [Entity].[Employment]
(
   [Employment_ID]         VARCHAR(30) NOT NULL,

   [Employer_ID]           VARCHAR(30) NULL,
   [Employee_ID]           VARCHAR(30) NULL,

   [Type_ID]               VARCHAR(30) NULL,
   [Name]                  VARCHAR(80) NULL,
   [Description]           VARCHAR(256) NULL,

   [Start_Date]            DATE NULL,
   [Ended_Date]            DATE NULL,

   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Efective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Efective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Employment] PRIMARY KEY CLUSTERED ([Employment_ID] ASC),
   CONSTRAINT [fk_Employment_Employer] FOREIGN KEY ([Employer_ID])
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [fk_Employment_Employee] FOREIGN KEY ([Employee_ID])
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [fk_Employment_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Entity].[Employment_Type] ([Type_ID])
)
