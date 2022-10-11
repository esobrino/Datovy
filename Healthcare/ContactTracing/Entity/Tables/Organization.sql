CREATE TABLE [Entity].[Organization] (
   [Organization_ID]          VARCHAR(30) NOT NULL,
   [Alternate_ID]             VARCHAR(40) NULL,
   [Organization_Type_ID]     VARCHAR(30) NULL,
   [Organization_Name]        VARCHAR(80) NULL,
   [Organization_URL]         VARCHAR(256) NULL,
   [Organization_Description] VARCHAR(256) NULL,
    
   [Status_Code_ID]           VARCHAR(30) NULL,
   [Status_DateTime]          DATETIMEOFFSET NULL,

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

    CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED ([Organization_ID] ASC)
);


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'External Agency', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Organization', 
   @level2type = N'COLUMN',   @level2name = 'Organization_Type_ID';

