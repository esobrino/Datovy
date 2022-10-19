CREATE TABLE [Management].[Case] (
   [Case_ID]               VARCHAR (30) NOT NULL,
   [Case_Type_ID]          VARCHAR (30) NULL,
   [Alternate_ID]          VARCHAR (40) NULL,
   
   [Officer_ID]            VARCHAR (30) NULL,
   [Person_ID]             VARCHAR (30) NULL,
   [Provider_ID]           VARCHAR (30) NULL,
   [Organization_ID]       VARCHAR (30) NULL,

   [Disposition_ID]        VARCHAR (30) NULL,
   [Medication_ID]         VARCHAR (30) NULL,
   [Medical_Condition_ID]  VARCHAR (30) NULL,
   [Profile_ID]            VARCHAR (30) NULL,
   [Priority_Code_ID]      VARCHAR (30) NULL,

   [Person_Age]            INT NULL,
   [Person_Age_Unit]       VARCHAR (30) NULL,
   
   [Class_Status_Code_ID]  VARCHAR (30) NULL,
   [Status_Code_ID]        VARCHAR (30) NULL,
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

   CONSTRAINT [pk_Case] PRIMARY KEY CLUSTERED ([Case_ID] ASC),
   CONSTRAINT [fk_Case_Case_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Management].[Disposition] ([Disposition_ID]),
   CONSTRAINT [fk_Case_CasePriorityCode] FOREIGN KEY ([Priority_Code_ID]) 
      REFERENCES [Management].[Case_Priority_Code] ([Code_ID]),
   CONSTRAINT [fk_Case_CaseType] FOREIGN KEY ([Case_Type_ID]) 
      REFERENCES [Management].[Case_Type] ([Type_ID]),
   CONSTRAINT [fk_Case_Medical_Condition] FOREIGN KEY ([Medical_Condition_ID]) 
      REFERENCES [Healthcare].[Medical_Condition] ([Medical_Condition_ID]),
   CONSTRAINT [fk_Case_Medication] FOREIGN KEY ([Medication_ID]) 
      REFERENCES [Healthcare].[Medication] ([Medication_ID]),
   CONSTRAINT [fk_Case_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [fk_Case_Person] FOREIGN KEY ([Person_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [fk_Case_Class_Status] FOREIGN KEY ([Class_Status_Code_ID]) 
      REFERENCES [Management].[Class_Status_Code] ([Code_ID]),
   CONSTRAINT [fk_Case_Profile_Group] FOREIGN KEY ([Profile_ID]) 
      REFERENCES [Surveillance].[Profile] ([Profile_ID]),
   CONSTRAINT [fk_Case_Provider] FOREIGN KEY ([Provider_ID]) 
      REFERENCES [Healthcare].[Provider] ([Provider_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Person/Patient age unit at time of case investigation', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Person_Age_Unit';
GO
