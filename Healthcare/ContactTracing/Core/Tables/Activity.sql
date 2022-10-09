CREATE TABLE [Core].[Activity] (
   [Activity_ID]           VARCHAR(30)  NOT NULL,
   [Alternate_ID]          VARCHAR(40)  NULL,
   [Case_ID]               VARCHAR(30)  NULL,
   [Location_ID]           VARCHAR(30)  NULL,
   [Disposition_ID]        VARCHAR(30)  NULL,
   [Activity_Name]         VARCHAR(80)  NULL,
   [Activity_Type_ID]      VARCHAR(30)  NULL,
   [Description]           VARCHAR(256) NULL,
    
   [Priority_Code_ID]      VARCHAR(30)  NULL,
   [Reason_Code_ID]        VARCHAR(30)  NULL,
   [Contact_ID]            VARCHAR(30)  NULL, 
   
   [Status_Code_ID]        VARCHAR(30) NULL,
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

   CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([Activity_ID] ASC),
   CONSTRAINT [FK_Activity_Activity_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Core].[Activity_Disposition] ([Disposition_ID]),
   CONSTRAINT [FK_Activity_ActivityPriorityCode] FOREIGN KEY ([Priority_Code_ID])
      REFERENCES [Core].[Activity_Priority_Code] ([Code_ID]),
   CONSTRAINT [FK_Activity_ActivityReasonCode] FOREIGN KEY ([Reason_Code_ID]) 
      REFERENCES [Core].[Activity_Reason_Code] ([Code_ID]),
   CONSTRAINT [FK_Activity_ActivityType] FOREIGN KEY ([Activity_Type_ID]) 
      REFERENCES [Core].[Activity_Type] ([Type_ID]),
   CONSTRAINT [FK_Activity_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [FK_Activity_Contact] FOREIGN KEY ([Contact_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID]),
   CONSTRAINT [FK_Activity_Location] FOREIGN KEY ([Location_ID]) 
      REFERENCES [Core].[Location] ([Location_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Activity_Disposition]
    ON [Core].[Activity]([Disposition_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_ActivityPriorityCode]
    ON [Core].[Activity]([Priority_Code_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_ActivityReasonCode]
    ON [Core].[Activity]([Reason_Code_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_ActivityType]
    ON [Core].[Activity]([Activity_Type_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Case]
    ON [Core].[Activity]([Case_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Contact]
    ON [Core].[Activity]([Contact_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Activity_Location]
    ON [Core].[Activity]([Location_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Example : CDCNotifiedDate  CDC Notification is an activity and CDC Notified Date is the activity Date

Example: DateFirstReportedToPublicHealth -- Date First Reported to Public Health (Activity or Event)
Date is the activity date.
Activity -- Individual Events ', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Laboratory Results', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Activity', @level2type = N'COLUMN', @level2name = N'Activity_Type_ID';

