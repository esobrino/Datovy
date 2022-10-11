CREATE TABLE [Entity].[Person_Flag] (
   [Person_Flag_ID]        VARCHAR (30)  NOT NULL,
   [Person_ID]             VARCHAR (30)  NULL,
   [FlagCode_ID]           VARCHAR (30)  NULL,
   [Flag_Value]            VARCHAR (10)  NULL,
   [Description]           VARCHAR (256) NULL,

   [Status_Code_ID]        VARCHAR (30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,

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

   CONSTRAINT [PK_Person_Flag] PRIMARY KEY CLUSTERED ([Person_Flag_ID] ASC),
   CONSTRAINT [FK_Person_Flag_FlagCode] FOREIGN KEY ([FlagCode_ID]) 
      REFERENCES [Entity].[Flag_Code] ([Code_ID]),
   CONSTRAINT [FK_Person_Flag_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person] ([Person_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = '''Y''', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person_Flag',
   @level2type = N'COLUMN',   @level2name = N'Flag_Value';
GO

