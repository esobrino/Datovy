CREATE TABLE [Clinical].[Complication]
(
   [Complication_ID]        VARCHAR(40) NOT NULL,
   [Complication_Code_ID]   VARCHAR(30) NOT NULL,
   [Complication_Flag_ID]   VARCHAR(30) NULL,

   [Acquired_DateTime]      DATE NULL,
   [Recorded_DateTime]      DATE NULL,

   -- external reference
   [Subject_ID]             VARCHAR(40) NULL,
   [Case_ID]                VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Complication] PRIMARY KEY CLUSTERED ([Complication_ID] ASC),
   CONSTRAINT [fk_Complication_Code] FOREIGN KEY ([Complication_Code_ID])
      REFERENCES [Clinical].[Complication_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Flag] FOREIGN KEY ([Complication_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID])
)
