CREATE TABLE [Core].[Case_Disposition] (
    [Disposition_ID]     VARCHAR (30)  NOT NULL,
    [Disposition_Code_ID] VARCHAR (30)  NULL,

    [Status_Code_ID]      VARCHAR (30)  NULL,
    [Status_DateTime]           DATETIMEOFFSET   NULL,
    [Start_DateTime] DATETIMEOFFSET   NULL,
    [End_DateTime]   DATETIMEOFFSET   NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Case_Disposition] PRIMARY KEY CLUSTERED ([Disposition_ID] ASC)
);

