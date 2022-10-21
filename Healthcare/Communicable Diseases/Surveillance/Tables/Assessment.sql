CREATE TABLE [Surveillance].[Assessment] (
   [Assessment_ID]            VARCHAR(40)   NOT NULL,
   [Alternate_ID]             VARCHAR(40)   NULL,
   [Case_ID]                  VARCHAR(40)   NULL,
   [Description]              VARCHAR(1024) NULL,
   [Assessment_Type_ID]       VARCHAR(30)   NULL,
    
   [Questionnaire_URL]        VARCHAR(256)  NULL,
   [Questionnaire_Answer_URL] VARCHAR(256)  NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Assessment] PRIMARY KEY CLUSTERED ([Assessment_ID] ASC),
   CONSTRAINT [fk_Assessment_AssessmentType] FOREIGN KEY ([Assessment_Type_ID]) 
      REFERENCES [Surveillance].[Assessment_Type] ([Type_ID]),
   CONSTRAINT [fk_Assessment_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'AST<timestamp>000001', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Assessment', 
   @level2type = N'COLUMN',   @level2name = 'Assessment_ID';

