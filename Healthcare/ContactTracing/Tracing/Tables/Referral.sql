CREATE TABLE [Tracing].[Referral] (
    [Referral_ID]       VARCHAR (30)  NOT NULL,
    [Referral_Type_ID]   VARCHAR (30)  NULL,
    [Referral_Case_ID]   VARCHAR (30)  NULL,
    [Referral_DateTime] DATETIMEOFFSET NULL,

    [Alternate_ID]      VARCHAR (40)  NULL,

    [Case_ID]           VARCHAR (30)  NULL,
    [Profile_ID]        VARCHAR (30)  NULL,
    [Status_Code_ID]     VARCHAR (30)  NULL,
    [Status_DateTime]   DATETIMEOFFSET NULL,
    [Provider_ID]       VARCHAR (30)  NULL,
    [Activity_ID]       VARCHAR (30)  NULL,

    [Tenant_ID]         VARCHAR(30) NOT NULL,
    [Data_Owner_ID]        VARCHAR(30) NULL,
    [Agency_Reporting_ID]        VARCHAR(30) NULL,
    [Version_Number]                  VARCHAR(20),
    [Sequence_Number]             INTEGER NULL,
    [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
    [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
    [Session_Updated_ID]    VARCHAR(40),

    CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED ([Referral_ID] ASC),
    CONSTRAINT [FK_Referral_Activity] FOREIGN KEY ([Activity_ID]) 
       REFERENCES [Core].[Activity] ([Activity_ID]),
    CONSTRAINT [FK_Referral_Case] FOREIGN KEY ([Case_ID]) 
       REFERENCES [Core].[Case] ([Case_ID]),
    CONSTRAINT [FK_Referral_Profile] FOREIGN KEY ([Profile_ID]) 
       REFERENCES [Tracing].[Profile] ([Profile_ID]),
    CONSTRAINT [FK_Referral_ReferralType] FOREIGN KEY ([Referral_Type_ID]) 
       REFERENCES [Code].[Referral_Type] ([Type_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Referral_Activity]
    ON [Tracing].[Referral]([Activity_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Referral_Case]
    ON [Tracing].[Referral]([Case_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Referral_Profile]
    ON [Tracing].[Referral]([Profile_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Referral_ReferralType]
    ON [Tracing].[Referral]([Referral_Type_ID] ASC);

