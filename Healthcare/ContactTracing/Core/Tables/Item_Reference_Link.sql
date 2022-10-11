CREATE TABLE [Core].[Item_Reference_Link] (
   [Item_Reference_Link_ID] VARCHAR (30) NOT NULL,
   [Reference_ID]           VARCHAR (30) NULL,
   [Reference_Type]         VARCHAR (50) NULL,

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

   CONSTRAINT [PK_Reference_Link] PRIMARY KEY CLUSTERED ([Item_Reference_Link_ID] ASC),
   CONSTRAINT [FK_Item_Reference_Link_Activity] FOREIGN KEY ([Reference_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Item_Reference_Link_Case] FOREIGN KEY ([Reference_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [FK_Item_Reference_Link_Item] FOREIGN KEY ([Reference_ID]) 
      REFERENCES [Core].[Item] ([Item_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Reference Type -- Activity, Case', 
   @level0type = N'SCHEMA',   @level0name = N'Core', 
   @level1type = N'TABLE',    @level1name = N'Item_Reference_Link', 
   @level2type = N'COLUMN',   @level2name = 'Reference_Type';
GO

