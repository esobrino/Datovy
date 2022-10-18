CREATE TABLE [Management].[Case_Flag] (
   [Case_Flag_ID]          VARCHAR(30)  NOT NULL,
   [Case_ID]               VARCHAR(30)  NULL,
   [Flag_Code_ID]          VARCHAR(30)  NULL,
   [Flag_Value]            VARCHAR(10)  NULL,
   [Flag_Description]      VARCHAR(256) NULL,

   [Status_Code_ID]        VARCHAR(30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Case_Flag] PRIMARY KEY CLUSTERED ([Case_Flag_ID] ASC),
   CONSTRAINT [fk_Case_Flag_Case] FOREIGN KEY ([Case_ID])
     REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [fk_Case_Flag_FlagCode] FOREIGN KEY ([Flag_Code_ID]) 
      REFERENCES [Management].[Case_Flag_Code] ([Code_ID])
);
GO

