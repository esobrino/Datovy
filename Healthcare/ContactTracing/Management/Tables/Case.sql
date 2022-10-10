CREATE TABLE [Management].[Case] (
   [Case_ID]               VARCHAR (30)  NOT NULL,
   [Alternate_ID]          VARCHAR (40)  NULL,
   [Case_Type_ID]          VARCHAR (30)  NULL,
   
   [Officer_ID]            VARCHAR (30)  NULL,
   [Person_ID]             VARCHAR (30)  NULL,
   [Provider_ID]           VARCHAR (30)  NULL,
   [Organization_ID]       VARCHAR (30)  NULL,
   [Disposition_ID]        VARCHAR (30)  NULL,
   [Medication_ID]         VARCHAR (30)  NULL,
   [Medical_Condition_ID]  VARCHAR (30)  NULL,
   [Profile_ID]            VARCHAR (30)  NULL,
   [Priority_Code_ID]      VARCHAR (30) NULL,
   
   [Status_Code_ID]        VARCHAR (30) NULL,
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

   CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED ([Case_ID] ASC),
   CONSTRAINT [FK_Case_Case_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Management].[Case_Disposition] ([Disposition_ID]),
   CONSTRAINT [FK_Case_CasePriorityCode] FOREIGN KEY ([Priority_Code_ID]) 
      REFERENCES [Management].[Case_Priority_Code] ([Code_ID]),
   CONSTRAINT [FK_Case_CaseType] FOREIGN KEY ([Case_Type_ID]) 
      REFERENCES [Management].[Case_Type] ([Type_ID]),
   CONSTRAINT [FK_Case_Medical_Condition] FOREIGN KEY ([Medical_Condition_ID]) 
      REFERENCES [Healthcare].[Medical_Condition] ([Medical_Condition_ID]),
   CONSTRAINT [FK_Case_Medication] FOREIGN KEY ([Medication_ID]) 
      REFERENCES [Healthcare].[Medication] ([Medication_ID]),
   CONSTRAINT [FK_Case_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [FK_Case_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [FK_Case_Profile_Group] FOREIGN KEY ([Profile_ID]) 
      REFERENCES [Tracing].[Profile] ([Profile_ID]),
   CONSTRAINT [FK_Case_Provider] FOREIGN KEY ([Provider_ID]) 
      REFERENCES [Healthcare].[Provider] ([Provider_ID])
);
GO

