﻿CREATE TABLE [Action].[Party] (
   [Party_ID]               VARCHAR (30) NOT NULL,
   [Type_ID]                VARCHAR (30) NULL,
   [Identification_ID]      VARCHAR (80) NULL,
   [Role_Code_ID]           VARCHAR (30) NULL,
   [Duration]               VARCHAR (50) NULL,

   -- external references
   [Contact_ID]             VARCHAR (30) NULL,
   [Activity_ID]            VARCHAR (30) NULL,
   [Person_ID]              VARCHAR (30) NULL,
   
   [Status_Code_ID]         VARCHAR (30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]              VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(30) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Party] PRIMARY KEY CLUSTERED ([Party_ID] ASC),
   CONSTRAINT [fk_Party_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Action].[Activity] ([Activity_ID]),
   CONSTRAINT [fk_Party_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Action].[Party_Type] ([Code_ID]),
   CONSTRAINT [fk_Party_Role] FOREIGN KEY ([Role_Code_ID]) 
      REFERENCES [Action].[Role_Code] ([Code_ID])
);
GO
