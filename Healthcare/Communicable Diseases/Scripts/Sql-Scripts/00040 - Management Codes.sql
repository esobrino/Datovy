

-- PHVS Case Class Status NND - CDC - v1
INSERT INTO [Management].[Class_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('410605003', 'Confirmed present (qualifier value)', 'SNOMED-CT'),
   ('PHC178',    'Not a Case', 'PHIN VS (CDC Local Coding System)'),
   ('2931005',   'Probable diagnosis (contextual qualifier) (qualifier value)', 'SNOMED-CT'),
   ('415684004', 'Suspected (qualifier value)', 'SNOMED-CT'),
   ('UNK', 'unknown', 'NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Class_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO


-- PHVS Case Class Status NND - CDC - v2
INSERT INTO [Management].[Age_Unit_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('d', 'day', 'PH_UnitsOfMeasure_UCUM'),
   ('h', 'hour', 'PH_UnitsOfMeasure_UCUM'),
   ('min', 'minute', 'PH_UnitsOfMeasure_UCUM'),
   ('mo', 'month', 'PH_UnitsOfMeasure_UCUM'),
   ('OTH', 'other', 'PH_NullFlavor_HL7_V3'),
   ('s', 'second', 'PH_UnitsOfMeasure_UCUM'),
   ('UNK', 'unknown', 'PH_NullFlavor_HL7_V3'),
   ('wk', 'week', 'PH_UnitsOfMeasure_UCUM'),
   ('a', 'year', 'PH_UnitsOfMeasure_UCUM')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Class_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

