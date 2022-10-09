﻿CREATE TABLE [Healthcare].[Treatment] (
   [Treatment_Id]              VARCHAR (30)    NOT NULL,
   [Activity_ID]               VARCHAR (30)    NULL,
   [Treatment_Given_Indicator] CHAR (1)        NULL,
   [Treatment_Name]            VARCHAR (80)    NULL,
   [Start_Date]                DATETIME2 (7)   NULL,
   [End_Date]                  DATETIME2 (7)   NULL,
   [Treatment_Quantity]        DECIMAL (18, 5) NULL,
   [Treatment_Form]            VARCHAR (30)    NULL,
   [Treatment_Comment]         VARCHAR (4000)  NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL,
   [Version_Number]        VARCHAR(20),
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Treatment] PRIMARY KEY CLUSTERED ([Treatment_Id] ASC),
   CONSTRAINT [FK_Treatment_Activity] FOREIGN KEY ([Activity_ID])
      REFERENCES [Core].[Activity] ([Activity_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Treatment_Activity]
    ON [Healthcare].[Treatment]([Activity_ID] ASC);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'If treatment was administered', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Treatment_Given_Indicator';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Name of treatment', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Treatment_Name';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Date treatment began/was given', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Start_Date';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Date treatment ended', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'End_Date';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Amount of the treatment given', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Treatment_Quantity';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Method treatment was administered',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Treatment_Form';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Comments about treatment this will be changed to a note',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Treatment_Comment';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Status of treatment', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Status_Code_ID';

