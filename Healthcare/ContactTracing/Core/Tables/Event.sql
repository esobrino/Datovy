CREATE TABLE [Core].[Event] (
   [Event_ID]              VARCHAR(30)  NOT NULL,
   [Alternate_ID]          VARCHAR(50)  NULL,
   [Activity_ID]           VARCHAR(30)  NULL,
   [EventType_ID]          VARCHAR(20)  NULL,
   [Participant_ID]        VARCHAR(30)  NULL,
   [Description]           VARCHAR(256) NULL,
   [Start_Date]            DATETIME2(7) NULL,
   [End_Date]              DATETIME2(7) NULL,
   
   [Status_Code_ID]        VARCHAR(30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Start_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [End_DateTime]          DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL,

   CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([Event_ID] ASC),
   CONSTRAINT [FK_Event_Activity] FOREIGN KEY ([Activity_ID])
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Event_Participant] FOREIGN KEY ([Participant_ID]) 
      REFERENCES [Core].[Participant] ([Participant_ID])
);
GO

CREATE NONCLUSTERED INDEX [IXFK_Event_Activity]
    ON [Core].[Event]([Activity_ID] ASC);
GO

CREATE NONCLUSTERED INDEX [IXFK_Event_Participant]
    ON [Core].[Event]([Participant_ID] ASC);
GO

