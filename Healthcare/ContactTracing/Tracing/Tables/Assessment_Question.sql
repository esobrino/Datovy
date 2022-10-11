CREATE TABLE [Tracing].[Assessment_Question] (
   [Question_ID]           VARCHAR(30)  NOT NULL,
   [Questionnaire_ID]      VARCHAR(30)  NULL,
   [Assessment_ID]         VARCHAR(30)  NULL,
   [Question_Sequence]     INT          NULL,
   [Question_Text]         VARCHAR(512) NULL,
   [Answer_Type_ID]        VARCHAR(30)  NULL,

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

   CONSTRAINT [PK_Assessment_Question] PRIMARY KEY CLUSTERED ([Question_ID] ASC),
   CONSTRAINT [FK_Assessment_Question_AnswerType] FOREIGN KEY ([Answer_Type_ID]) 
      REFERENCES [Tracing].[Answer_Type] ([Type_ID])
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Base Type Complex Type single-select, multi-select radio button, date-time if calendar, free text, option', 
   @level0type = N'SCHEMA',   @level0name = N'Tracing', 
   @level1type = N'TABLE',    @level1name = N'Assessment_Question', 
   @level2type = N'COLUMN',   @level2name = 'Answer_Type_ID';

