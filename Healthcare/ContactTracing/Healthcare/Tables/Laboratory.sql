CREATE TABLE [Healthcare].[Laboratory] (
   [Laboratory_ID]         VARCHAR (30) NOT NULL,
   [Alternate_ID]          VARCHAR (40) NULL,
   [Activity_ID]           VARCHAR (30) NULL,
   [Lab_Code_ID]           VARCHAR (30) NULL,
   [Lab_Name]              VARCHAR (80) NULL,
   [Lab_Type_ID]           VARCHAR (30) NULL,

   [Vendor_LIMS_Code_ID]   VARCHAR (30) NULL,
   
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

   CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED ([Laboratory_ID] ASC),
   CONSTRAINT [FK_Laboratory_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Laboratory_Activity]
    ON [Healthcare].[Laboratory]([Activity_ID] ASC);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Laboratory Type ',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Laboratory',
   @level2type = N'COLUMN',   @level2name = 'Lab_Type_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'LIMS - Laborary Information Management System',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Laboratory',
   @level2type = N'COLUMN',   @level2name = 'Vendor_LIMS_Code_ID';
GO


