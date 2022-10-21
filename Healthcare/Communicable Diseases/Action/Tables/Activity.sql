﻿CREATE TABLE [Action].[Activity] (
   [Activity_ID]            VARCHAR(40)  NOT NULL,
   [Alternate_ID]           VARCHAR(40)  NULL,
   [Type_ID]                VARCHAR(30)  NULL,
   [Disposition_ID]         VARCHAR(40)  NULL,

   [Name]                   VARCHAR(80)  NULL,
   [Description]            VARCHAR(256) NULL,
    
   [Priority_Code_ID]       VARCHAR(30)  NULL,
   [Reason_Code_ID]         VARCHAR(30)  NULL,

   [Scheduled_DateTime]     DATETIMEOFFSET NULL,
   [Started_DateTime]       DATETIMEOFFSET NULL,
   [Ended_DateTime]         DATETIMEOFFSET NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external references
   [Case_ID]                VARCHAR(40)  NULL,
   [Location_ID]            VARCHAR(40)  NULL,
   [Contact_ID]             VARCHAR(40)  NULL, 

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

   CONSTRAINT [pk_Activity] PRIMARY KEY CLUSTERED ([Activity_ID] ASC),
   CONSTRAINT [fk_Activity_Activity_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Action].[Disposition] ([Disposition_ID]),
   CONSTRAINT [fk_Activity_Priority_Code] FOREIGN KEY ([Priority_Code_ID])
      REFERENCES [Action].[Priority_Code] ([Code_ID]),
   CONSTRAINT [fk_Activity_Reason_Code] FOREIGN KEY ([Reason_Code_ID]) 
      REFERENCES [Action].[Reason_Code] ([Code_ID]),
   CONSTRAINT [fk_Activity_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Action].[Activity_Type] ([Type_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Example : CDCNotifiedDate  CDC Notification is an activity and CDC Notified Date is the activity Date Example: DateFirstReportedToPublicHealth -- Date First Reported to Public Health (Activity or Event) Date is the activity date. Activity -- Individual Events ', 
   @level0type = N'SCHEMA',   @level0name = N'Action', 
   @level1type = N'TABLE',    @level1name = N'Activity';
GO
