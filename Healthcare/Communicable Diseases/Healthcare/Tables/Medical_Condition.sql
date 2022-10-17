CREATE TABLE [Healthcare].[Medical_Condition] (
   [Medical_Condition_ID]  VARCHAR (30) NOT NULL,
   [Condition_Type_ID]     VARCHAR (30) NULL,
   [Qualifier_Text]        VARCHAR (30) NULL,
   [Qualifier_Code_ID]     VARCHAR (30) NULL,
   [Severity_Code_ID]      VARCHAR (30) NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
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

   CONSTRAINT [pk_Medical_Condition] PRIMARY KEY CLUSTERED ([Medical_Condition_ID] ASC)
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Symptoms, conditions, susceptibility, and other qualifiers ',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Medical_Condition';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Pan-Sensitive - 1st line of drugs will kill the bacteria Resistant = second line of drugs - additional durgs (Resistant  = lacking the ability to resist something (as a pathogen, familial disease, or a drug) : sensitivity) Category Susceptibility Susceptible : likely or liable to be influenced or harmed by a particular thing: "patients with liver disease may be susceptible to infection"', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medical_Condition', 
   @level2type = N'COLUMN',   @level2name = 'Condition_Type_ID';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Drugs', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medical_Condition',
   @level2type = N'COLUMN',   @level2name = 'Qualifier_Text';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Name of Drugs',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Medical_Condition', 
   @level2type = N'COLUMN',   @level2name = 'Qualifier_Code_ID';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Severe Moderate Mild', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medical_Condition',
   @level2type = N'COLUMN',   @level2name = 'Severity_Code_ID';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Level Code System Display Definition Canonical Mapping for "Condition Clinical Status Codes" HL7 clinical conditions.', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medical_Condition', 
   @level2type = N'COLUMN',   @level2name = 'Status_Code_ID';

