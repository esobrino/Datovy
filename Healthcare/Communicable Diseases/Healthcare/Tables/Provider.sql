CREATE TABLE [Healthcare].[Provider] (
   [Provider_ID]           VARCHAR (40) NOT NULL,
   [Alternate_ID]          VARCHAR (40) NULL,

   [Person_ID]             VARCHAR (40) NULL,
   [Organization_ID]       VARCHAR (40) NULL,
   [Provider_Type_ID]      VARCHAR (40) NULL,

   [Name_ID]               VARCHAR (30) NULL,

   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Practitioner] PRIMARY KEY CLUSTERED ([Provider_ID] ASC),
   CONSTRAINT [fk_Provider_Name] FOREIGN KEY ([Name_ID])
      REFERENCES [Entity].[Name]([Name_ID]),

   CONSTRAINT [fk_Provider_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [fk_Provider_Entity] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Referring Provider Attending Provider Primary Care Provider (PCP)',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Provider',
   @level2type = N'COLUMN',   @level2name = 'Provider_Type_ID';

