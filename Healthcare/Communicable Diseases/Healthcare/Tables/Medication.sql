CREATE TABLE [Healthcare].[Medication] (
   [Medication_ID]                VARCHAR(30)   NOT NULL,
   [Alternate_ID]                 VARCHAR(40)   NULL,
   [Medication_Code_ID]           VARCHAR(30)   NULL,
   [Dose_Form_Code_ID]            VARCHAR(30)   NULL,
   [Purpose_Code_ID]              VARCHAR(30)   NULL,
   [Prescribed_DateTime]          DATETIMEOFFSET NULL,
   [Monitor_Medication_Flag]      CHAR(1) NULL,
   [Monitor_DateTime]             DATETIMEOFFSET NULL,
   [Dosage_Ordered]               DECIMAL(5, 3) NULL,
   [Dosage_Ordered_Unit_Code_ID]  VARCHAR(30)   NULL,
   [Dosage_Strength]              DECIMAL(5, 3) NULL,
   [Dosage_Strength_Unit_Code_ID] VARCHAR(30)   NULL,
   [Measure_Unit]                 DECIMAL(5, 3) NULL,
   [Measure_Unit_Code_ID]         VARCHAR(30)   NULL,
   [Dosage_Calculated]            VARCHAR(30)   NULL,
   [Frequency_Code_ID]            VARCHAR(30)   NULL,
   [AdditionalInstruction]        VARCHAR(256)  NULL,
   
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

   CONSTRAINT [pk_Medication] PRIMARY KEY CLUSTERED ([Medication_ID] ASC),
   CONSTRAINT [fk_Medication_DosageForm] FOREIGN KEY ([Dose_Form_Code_ID]) 
      REFERENCES [Healthcare].[Dosage_Form_Code] ([Code_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'powder | tablets | capsule | liquid tab = tablet cap = capsule',
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Dose_Form_Code_ID';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'The doctor orders 90 milligrams of liquid cough syrup. The liquid cough syrup has a label that reads 120 milligrams in 5 milliliters. How much cough syrup should the nurse give to the patient? Given: D (Dosage Ordered) = 90 mg H  (Dosage Strength) = 120 mg Q (Unit of Measure) = 5 mL x (Dosage Calculated) = 90 mg 120 mg x 5 mL x =3/4 x 5 mL x = 15/4 mL x = 3.75 mL Therefore, the nurse should give 3.75 mL of the cough syrup to the patient.', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Dosage_Ordered';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = '2.5 milligram (Details: UCUM code mg = ''mg'') Dosage Unit mg', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = 'Dosage_Strength';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Unit of Measure per 2 mL per capsule per tablet', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare',
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = N'Measure_Unit';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'q every day, bid twice a day, tid three times a day, qid four times a day', 
   @level0type = N'SCHEMA',   @level0name = N'Healthcare', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Frequency_Code_ID';
GO

