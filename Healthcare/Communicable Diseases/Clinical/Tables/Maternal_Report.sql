CREATE TABLE [Clinical].[Maternal_Report]
(
   [Maternal_Report_ID]     VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,
   [Jurisdiction_Code_ID]   VARCHAR(30) NULL,

   [Pregnancies_Number]     INT NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Maternal_Report] PRIMARY KEY CLUSTERED ([Maternal_Report_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Number of pregnancies. This includes current pregnancy and previous pregnancies (Gravida).', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Pregnancies_Number';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Provide the national reporting jurisdiction used for reporting mother''s case.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Jurisdiction_Code_ID';
GO
