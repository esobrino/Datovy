CREATE TABLE [Tracing].[Assessment_Question] (
    [Assessment_Question_ID]      VARCHAR (30)  NOT NULL,
    [Assessment_ID]              VARCHAR (30)  NULL,
    [Question_Sequence]          INT           NULL,
    [Question]                  VARCHAR (512) NULL,
    [Answer_Type_ID]              VARCHAR (30)  NULL,
    [AssessmentQuestionnaire_ID] VARCHAR (30)  NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Assessment_Question] PRIMARY KEY CLUSTERED ([Assessment_Question_ID] ASC),
    CONSTRAINT [FK_Assessment_Question_AnswerType] FOREIGN KEY ([Answer_Type_ID]) REFERENCES [Code].[Answer_Type] ([Type_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Question_AnswerType]
    ON [Tracing].[Assessment_Question]([Answer_Type_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Question_Assessment_Questionnaire]
    ON [Tracing].[Assessment_Question]([AssessmentQuestionnaire_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Base Type
Complex Type

single-select
multi-select radio button
date-time if calendar
free text
option', @level0type = N'SCHEMA', @level0name = N'Tracing', @level1type = N'TABLE', @level1name = N'Assessment_Question', @level2type = N'COLUMN', @level2name = 'Answer_Type_ID';

