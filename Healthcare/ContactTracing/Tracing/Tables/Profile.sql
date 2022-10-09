CREATE TABLE [Tracing].[Profile] (
    [Profile_ID]     VARCHAR (30)  NOT NULL,
    [Profile_Type_ID] VARCHAR (30)  NULL,
    [Profile_Name]   VARCHAR (80)  NULL,
    [Start_DateTime]     DATETIME2 (7) NULL,
    [End_DateTime]       DATETIME2 (7) NULL,
    
    [Status_Code_ID]  VARCHAR (30)  NULL,
    [Status_DateTime]    DATETIME2 (7) NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),
    
    CONSTRAINT [PK_Profile_Group] PRIMARY KEY CLUSTERED ([Profile_ID] ASC),
    CONSTRAINT [FK_Profile_ProfileType] FOREIGN KEY ([Profile_Type_ID]) REFERENCES [Code].[Profile_Type] ([Type_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Profile_Group_Profile_Condition]
    ON [Tracing].[Profile]([Profile_Name] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Profile_ProfileType]
    ON [Tracing].[Profile]([Profile_Type_ID] ASC);

