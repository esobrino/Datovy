CREATE TABLE [Core].[Activity_Disposition] (
   [Disposition_ID]        VARCHAR(30) NOT NULL,
   [Disposition_Code_ID]   VARCHAR(30) NULL,
   
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

   CONSTRAINT [PK_Activity_Disposition] PRIMARY KEY CLUSTERED ([Disposition_ID] ASC)
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Laboratory Treatment',
   @level0type = N'SCHEMA',   @level0name = N'Core', 
   @level1type = N'TABLE',    @level1name = N'Activity_Disposition',
   @level2type = N'COLUMN',   @level2name = N'Disposition_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Positive Negative Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Core', 
   @level1type = N'TABLE',    @level1name = N'Activity_Disposition',
   @level2type = N'COLUMN',   @level2name = N'Status_Code_ID';

