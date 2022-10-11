CREATE TABLE Core.Uri_Type
(
   [Type_ID]               VARCHAR(30) NOT NULL,
   [Description]           VARCHAR(80),
   [Category_Code]         VARCHAR(30)  NULL,
   [Tags]                  VARCHAR(128) NULL,

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

   CONSTRAINT [pk_Entity_Uri_Type] PRIMARY KEY CLUSTERED ([Type_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Provided to set a comma delimited list of Privacy, Security or other data Tags such as GDPR, HIPAA, PII or other.',
   @level0type = N'SCHEMA',   @level0name = N'Core',
   @level1type = N'TABLE',    @level1name = N'Uri_Type', 
   @level2type = N'COLUMN',   @level2name = 'Tags';
GO

