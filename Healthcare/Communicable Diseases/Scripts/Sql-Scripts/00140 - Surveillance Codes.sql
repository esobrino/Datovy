

-- Exposure Setting v2
INSERT INTO [Surveillance].[Exposure_Setting_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('257562009','Airport (environment)','SNOMED-CT'),
   ('PHC2266','Animal with confirmed or suspected disease','PHIN VS (CDC Local Coding System)'),
   ('413817003','Child day care center (environment)','SNOMED-CT'),
   ('C3826521','Congregate housing','UMLS'),
   ('PHC2267','Contact with known case','PHIN VS (CDC Local Coding System)'),
   ('C1880391','Domestic','UMLS'),
   ('C1512888','International','UMLS'),
   ('C3841750','Mass gathering','UMLS'),
   ('OTH','other','NullFlavor'),
   ('257656006','Penal institution (environment)','SNOMED-CT'),
   ('473085002','Recent cruise travel (event)','SNOMED-CT'),
   ('257698009','School (environment)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor'),
   ('285141008','Work environment (environment)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Travel_Purpose_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Travel Purpose v2
INSERT INTO [Surveillance].[Travel_Purpose_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('702348006','Active duty military (occupation)','SNOMED-CT'),
   ('PHC386','Business','PHIN VS (CDC Local Coding System)'),
   ('C0013976','Emigration and Immigration','UMLS'),
   ('OTH','other','NullFlavor'),
   ('440593000','Response of community to disaster (observable entity)','SNOMED-CT'),
   ('C0683587','tourism','UMLS'),
   ('UNK','unknown','NullFlavor'),
   ('PHC387','Visiting relatives and or friends','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Travel_Purpose_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO
