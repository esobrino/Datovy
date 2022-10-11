CREATE TABLE [Healthcare].[Provider] (
   [Provider_ID]           VARCHAR (30) NOT NULL,
   [Alternate_ID]          VARCHAR (40) NULL,
   [Organization_ID]       VARCHAR (30) NULL,
   [Provider_Type_ID]      VARCHAR (30) NULL,
   [Provider_GivenName]    VARCHAR (80) NULL,
   [Provider_MiddleName]   VARCHAR (50) NULL,
   [Provider_SurName]      VARCHAR (80) NULL,
   
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

   CONSTRAINT [PK_Practitioner] PRIMARY KEY CLUSTERED ([Provider_ID] ASC),
   CONSTRAINT [FK_Provider_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Referring Provider Attending Provider Primary Care Provider (PCP)',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Provider',
   @level2type = N'COLUMN',   @level2name = 'Provider_Type_ID';

