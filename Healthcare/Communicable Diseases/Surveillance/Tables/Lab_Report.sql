﻿CREATE TABLE [Surveillance].[Lab_Report]
(
   [Lab_Report_ID]          VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,

   [Testing_Performed_Flag_ID] VARCHAR(30) NULL,
   [Lab_Confirmed_Flag_ID]     VARCHAR(30) NULL,
   [Specimen_Sent_Flag_ID]     VARCHAR(30) NULL,

   -- external Case ID reference...
   [Subject_ID]             VARCHAR(40) NULL,
   [Case_ID]                VARCHAR(40) NULL,

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
     
   CONSTRAINT [pk_Lab_Report] PRIMARY KEY CLUSTERED ([Lab_Report_ID] ASC),
   CONSTRAINT [fk_Lab_Report_Testing_Performed_Flag] FOREIGN KEY ([Testing_Performed_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Lab_Report_Laboratory_Confirmed_Flag] FOREIGN KEY ([Lab_Confirmed_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Lab_Report_Specimen_Sent_Flag] FOREIGN KEY ([Specimen_Sent_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was the case laboratory confirmed?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Lab_Report',
   @level2type = N'COLUMN',   @level2name = 'Lab_Confirmed_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was a specimen sent to CDC for testing?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Lab_Report',
   @level2type = N'COLUMN',   @level2name = 'Specimen_Sent_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was laboratory testing done to confirm the diagnosis?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Lab_Report',
   @level2type = N'COLUMN',   @level2name = 'Testing_Performed_Flag_ID';
GO