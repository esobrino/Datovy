CREATE TABLE [Entity].[Officer_Type] (
   [Type_ID]               VARCHAR(30)  NOT NULL,
   [Description]           VARCHAR(128) NULL,
   [Category_Code]         VARCHAR(30)  NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Officer_Type] PRIMARY KEY CLUSTERED ([Type_ID] ASC)
);

