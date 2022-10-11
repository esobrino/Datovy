CREATE TABLE [Entity].[Communication] (
   [Communication_ID]        VARCHAR(30) NOT NULL,
   [Entity_ID]               VARCHAR(30) NULL,
   [Entity_Type_ID]          VARCHAR(30) NULL,
   [Device_Code_ID]          VARCHAR(30) NULL,
   [Device_Usage_Code_ID]    VARCHAR(20) NULL,
   [Phone_Country_Code_ID]   VARCHAR(5)  NULL,
   [Phone_Area_Code_ID]      VARCHAR(10) NULL,
   [Phone_Number]            VARCHAR(20) NULL,
   [Extension]               VARCHAR(10) NULL,

   [Status_Code_ID]          VARCHAR(30) NULL,
   [Status_DateTime]         DATETIMEOFFSET NULL,

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

   CONSTRAINT [PK_Communication] PRIMARY KEY CLUSTERED ([Communication_ID] ASC),
   CONSTRAINT [FK_Communication_Contact] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID]),
   CONSTRAINT [FK_Communication_Person] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Phone, Fax', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Communication', 
   @level2type = N'COLUMN',   @level2name = 'Device_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Work, Home, Office', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Communication',
   @level2type = N'COLUMN',   @level2name = 'Device_Usage_Code_ID';

