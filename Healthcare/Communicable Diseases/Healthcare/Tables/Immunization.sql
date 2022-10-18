CREATE TABLE [Healthcare].[Immunization] (
   [Immunization_ID]       VARCHAR (30)  NOT NULL,
   [Activity_ID]           VARCHAR (30)  NULL,
   [Organization_ID]       VARCHAR (30)  NULL,
   [Immunization_Type_ID]  VARCHAR (30)  NULL,
   [Administered_DateTime] DATETIMEOFFSET   NULL,
   [Dosage_SeriesNumber]   VARCHAR (20)  NULL,
   [Dosage_Amount]         VARCHAR (50)  NULL,
   [Lot_Number]            VARCHAR (20)  NULL,
   [Expiration_Date]       DATETIME2 (7) NULL,
   [Drug_Code_ID]          VARCHAR (30)  NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Immunization] PRIMARY KEY CLUSTERED ([Immunization_ID] ASC),
   CONSTRAINT [fk_Immunization_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [fk_Immunization_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID])
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Manufacturer ID and Name from Organization Table as a lookup', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Immunization', 
   @level2type = N'COLUMN',   @level2name = 'Organization_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'There are several types of vaccines, including: Inactivated vaccines. Live-attenuated vaccines. Messenger RNA (mRNA) vaccines.', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Immunization', 
   @level2type = N'COLUMN',   @level2name = 'Immunization_Type_ID';

