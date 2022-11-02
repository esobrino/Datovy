﻿CREATE TABLE [Clinical].[Infant_Report]
(
   [Maternal_Report_ID]     VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,

   [Birth_Weight]           INT NULL,
   [Birth_Gestational_Age]  INT NULL,
   [Birth_Status_Code_ID]   VARCHAR(30) NULL,

   -- external references...
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

   CONSTRAINT [pk_Infant_Report] PRIMARY KEY CLUSTERED ([Maternal_Report_ID] ASC),
   CONSTRAINT [fk_Infant_Report] FOREIGN KEY ([Birth_Status_Code_ID])
      REFERENCES [Clinical].[Birth_Status_Code]([Code_ID])
)