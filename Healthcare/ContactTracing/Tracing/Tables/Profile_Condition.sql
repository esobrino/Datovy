CREATE TABLE [Tracing].[Profile_Condition] (
    [Profile_Condition_ID] VARCHAR (30) NOT NULL,
    [Profile_ID]          VARCHAR (30) NULL,
    [Condition_Code_ID]    VARCHAR (30) NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Profile_Condition] PRIMARY KEY CLUSTERED ([Profile_Condition_ID] ASC),
    CONSTRAINT [FK_Profile_Condition_Profile_Group] FOREIGN KEY ([Profile_ID]) REFERENCES [Tracing].[Profile] ([Profile_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Profile_Condition_Profile_Group]
    ON [Tracing].[Profile_Condition]([Profile_ID] ASC);

