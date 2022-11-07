CREATE TABLE [Epidemiology].[Lab_Link]
(
   [Lab_Link_ID]            VARCHAR(40) NOT NULL,

   [Lab_Reference_ID]       VARCHAR(40) NOT NULL,
   [Patient_ID]             VARCHAR(40) NOT NULL,
   [Specimen_ID]            VARCHAR(40) NOT NULL,

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Lab_Link] PRIMARY KEY CLUSTERED ([Lab_Link_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = ' lab message patient Identifier that will be used along with the reference laboratory and specimen identifier to uniquely identify a VPD lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Specimen_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = ' lab message patient Identifier that will be used along with the reference laboratory and specimen identifier to uniquely identify a VPD lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Patient_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'reference laboratory that will be used along with the patient identifier and specimen identifier to uniquely identify a lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Lab_Reference_ID';
GO
