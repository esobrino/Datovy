CREATE TABLE [Entity].[Person_Flag] (
   [Person_Flag_ID]        VARCHAR (30)  NOT NULL,
   [Person_ID]             VARCHAR (30)  NULL,
   [FlagCode_ID]           VARCHAR (30)  NULL,
   [Flag_Value]            VARCHAR (10)  NULL,
   [Description]           VARCHAR (256) NULL,

   [Status_Code_ID]        VARCHAR (30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,
   [Start_DateTime]        DATETIMEOFFSET   NULL,
   [End_DateTime]          DATETIMEOFFSET   NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Person_Flag] PRIMARY KEY CLUSTERED ([Person_Flag_ID] ASC),
   CONSTRAINT [FK_Person_Flag_FlagCode] FOREIGN KEY ([FlagCode_ID]) 
      REFERENCES [Code].[Flag_Code] ([Code_ID]),
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

