CREATE TABLE [Surveillance].[Case_Report]
(
   [Case_Report_ID]         VARCHAR(30) NOT NULL,
   [Report_Date]            DATE NULL,

   [Type_ID]                VARCHAR(30) NULL,
   [Description]            VARCHAR(1024) NULL,

   [Setting_Code_ID]        VARCHAR(30) NULL,

   -- external Case ID reference...
   [Case_ID]                VARCHAR(40) NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

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

   CONSTRAINT [pk_Case_Report] PRIMARY KEY CLUSTERED ([Case_Report_ID] ASC),
   CONSTRAINT [fk_Case_Report_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Surveillance].[Report_Type]([Type_ID]),
   CONSTRAINT [fk_Case_Report_Setting] FOREIGN KEY ([Setting_Code_ID])
      REFERENCES [Surveillance].[Exposure_Setting_Code]([Code_ID])
)
