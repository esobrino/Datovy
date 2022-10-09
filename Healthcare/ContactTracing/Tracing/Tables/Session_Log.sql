CREATE TABLE [Tracing].[Session_Log] (
    [Session_Log_ID]     VARCHAR (30)  NOT NULL,
    [Referral_ID]       VARCHAR (30)  NULL,
    [Case_ID]           VARCHAR (30)  NULL,
    [Officier_ID]           VARCHAR(30) NULL,
    [Session_Type_ID]    VARCHAR (30)  NULL,
    [Session_DateTime]  DATETIMEOFFSET NULL,
    [Person_GivenName]  VARCHAR (80)  NULL,
    [Person_MiddleName] VARCHAR (50)  NULL,
    [Person_SurName]    VARCHAR (80)  NULL,
    [Email_Address]     VARCHAR (128) NULL,
    [Phone_Number]            VARCHAR (20)  NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Visit_Log] PRIMARY KEY CLUSTERED ([Session_Log_ID] ASC),
    CONSTRAINT [FK_Activity_Log_Case] FOREIGN KEY ([Case_ID]) REFERENCES [Core].[Case] ([Case_ID]),
    CONSTRAINT [FK_Activity_Log_Referral] FOREIGN KEY ([Referral_ID]) REFERENCES [Tracing].[Referral] ([Referral_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Log_Case]
    ON [Tracing].[Session_Log]([Case_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Log_Referral]
    ON [Tracing].[Session_Log]([Referral_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'If not case id then add person information', @level0type = N'SCHEMA', @level0name = N'Tracing', @level1type = N'TABLE', @level1name = N'Session_Log';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Follow-up', @level0type = N'SCHEMA', @level0name = N'Tracing', @level1type = N'TABLE', @level1name = N'Session_Log', @level2type = N'COLUMN', @level2name = 'Session_Type_ID';

