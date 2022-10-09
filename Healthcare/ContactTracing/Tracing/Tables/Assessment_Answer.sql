CREATE TABLE [Tracing].[Assessment_Answer] (
    [Answer_ID]             VARCHAR (30)  NOT NULL,
    [Assessment_ID]         VARCHAR (30)  NULL,
    [AssessmentQuestion_ID] VARCHAR (30)  NULL,
    [AnswerValue]          VARCHAR (256) NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Assessment_Answer] PRIMARY KEY CLUSTERED ([Answer_ID] ASC),
    CONSTRAINT [FK_Assessment_Answer_Assessment] FOREIGN KEY ([Assessment_ID]) REFERENCES [Tracing].[Assessment] ([Assessment_ID]),
    CONSTRAINT [FK_Assessment_Answer_Assessment_Question] FOREIGN KEY ([AssessmentQuestion_ID]) REFERENCES [Tracing].[Assessment_Question] ([Assessment_Question_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Answer_Assessment]
    ON [Tracing].[Assessment_Answer]([Assessment_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Answer_Assessment_Question]
    ON [Tracing].[Assessment_Answer]([AssessmentQuestion_ID] ASC);

