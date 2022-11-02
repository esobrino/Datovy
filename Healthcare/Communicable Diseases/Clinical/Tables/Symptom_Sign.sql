CREATE TABLE [Clinical].[Symptom_Sign]
(
   [Synmptom_Sign_ID]       VARCHAR(40) NOT NULL,
   [Sign_Code_ID]           VARCHAR(30) NOT NULL,
   [Sign_Flag_ID]           VARCHAR(30) NULL,

   [Acquired_DateTime]      DATE NULL,
   [Recorded_DateTime]      DATE NULL,

   -- external reference
   [Subject_ID]             VARCHAR(40) NOT NULL,

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Symptom_Sign] PRIMARY KEY CLUSTERED ([Synmptom_Sign_ID] ASC),
   CONSTRAINT [fk_Symptom_Sign] FOREIGN KEY ([Sign_Code_ID])
      REFERENCES [Clinical].[Symptom_Sign_Code]([Code_ID]),
   CONSTRAINT [fk_Symptom_Sign_Flag] FOREIGN KEY ([Sign_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID])
)
