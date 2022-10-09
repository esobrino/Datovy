CREATE TABLE [Tracing].[Schedule_Event]
(
   [Schedule_Event_ID]    VARCHAR(30) PRIMARY KEY,
   [Event_Type_ID]        VARCHAR(30) NULL,

   [Start_DateTime]      DATETIMEOFFSET NULL,
   [End_DateTime]        DATETIMEOFFSET NULL,

   [Tenant_ID]         VARCHAR(30) NOT NULL,
   [Data_Owner_ID]        VARCHAR(30) NULL,
   [Agency_Reporting_ID]        VARCHAR(30) NULL,
   [Version_Number]                  VARCHAR(20),
   [Sequence_Number]             INTEGER NULL,
   [Created_DateTime]    DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT FK_Schedule_Event FOREIGN KEY ([Event_Type_ID])
      REFERENCES Code.Activity_Type([Type_ID])
)
