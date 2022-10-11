CREATE TABLE [Tracing].[Assessment_Questionnaire] (
   [Questionnaire_ID]      VARCHAR(30)  NOT NULL,
   [Questionnaire_No]      INT NULL,
   [Title]                 VARCHAR(256) NULL,
   [Description]           VARCHAR(256) NULL,
   [Assessment_ID]         VARCHAR(30)  NULL,

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

   CONSTRAINT [PK_Assessment_Questionnaire] PRIMARY KEY CLUSTERED ([Questionnaire_ID] ASC)
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Questionnaire Template', 
   @level0type = N'SCHEMA',   @level0name = N'Tracing', 
   @level1type = N'TABLE',    @level1name = N'Assessment_Questionnaire';

