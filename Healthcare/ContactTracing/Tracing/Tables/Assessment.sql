CREATE TABLE [Tracing].[Assessment] (
   [Assessment_ID]            VARCHAR(30)   NOT NULL,
   [Alternate_ID]             VARCHAR(40)   NULL,
   [Case_ID]                  VARCHAR(30)   NULL,
   [Description]              VARCHAR(1024) NULL,
   [Assessment_Type_ID]       VARCHAR(30)   NULL,
    
   [Questionnaire_URL]        VARCHAR(256)  NULL,
   [Questionnaire_Answer_URL] VARCHAR(256)  NULL,
   
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

   CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED ([Assessment_ID] ASC),
   CONSTRAINT [FK_Assessment_AssessmentType] FOREIGN KEY ([Assessment_Type_ID]) 
      REFERENCES [Tracing].[Assessment_Type] ([Type_ID]),
   CONSTRAINT [FK_Assessment_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_AssessmentType]
    ON [Tracing].[Assessment]([Assessment_Type_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Case]
    ON [Tracing].[Assessment]([Case_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'AST<timestamp>000001', @level0type = N'SCHEMA', @level0name = N'Tracing', @level1type = N'TABLE', @level1name = N'Assessment', @level2type = N'COLUMN', @level2name = 'Assessment_ID';

