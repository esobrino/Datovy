CREATE TABLE [Core].[Case_Flag] (
   [Case_Flag_ID]          VARCHAR(30)  NOT NULL,
   [Case_ID]               VARCHAR(30)  NULL,
   [Flag_Code_ID]          VARCHAR(30)  NULL,
   [Flag_Value]            VARCHAR(10)  NULL,
   [Flag_Description]      VARCHAR(256) NULL,

   [Status_Code_ID]        VARCHAR(30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL,
   [Version_Number]        VARCHAR(20),
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Case_Flag] PRIMARY KEY CLUSTERED ([Case_Flag_ID] ASC),
   CONSTRAINT [FK_Case_Flag_Case] FOREIGN KEY ([Case_ID])
     REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [FK_Case_Flag_FlagCode] FOREIGN KEY ([Flag_Code_ID]) 
      REFERENCES [Management].[Case_Flag_Code] ([Code_ID])
);
GO

