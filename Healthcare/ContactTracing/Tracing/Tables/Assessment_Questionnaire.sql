CREATE TABLE [Tracing].[Assessment_Questionnaire] (
    [Assessment_Questionnaire_ID] VARCHAR (30)  NOT NULL,
    [Questionnaire_No]           INT           NULL,
    [Title]                     VARCHAR (256) NULL,
    [Description]               VARCHAR (256) NULL,
    [Assessment_ID]              VARCHAR (30)  NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Assessment_Questionnaire] PRIMARY KEY CLUSTERED ([Assessment_Questionnaire_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Assessment_Questionnaire_Assessment]
    ON [Tracing].[Assessment_Questionnaire]([Assessment_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Questionnaire Template', @level0type = N'SCHEMA', @level0name = N'Tracing', @level1type = N'TABLE', @level1name = N'Assessment_Questionnaire';

