CREATE TABLE [Tracing].[Assessment_Answer] (
   [Answer_ID]             VARCHAR(30)  NOT NULL,
   [Assessment_ID]         VARCHAR(30)  NULL,
   [Question_ID]           VARCHAR(30)  NULL,
   [AnswerValue]           VARCHAR(256) NULL,

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

   CONSTRAINT [PK_Assessment_Answer] PRIMARY KEY CLUSTERED ([Answer_ID] ASC),
   CONSTRAINT [FK_Assessment_Answer_Assessment] FOREIGN KEY ([Assessment_ID]) 
      REFERENCES [Tracing].[Assessment] ([Assessment_ID]),
   CONSTRAINT [FK_Assessment_Answer_Assessment_Question] FOREIGN KEY ([Question_ID]) 
      REFERENCES [Tracing].[Assessment_Question] ([Question_ID])
);


