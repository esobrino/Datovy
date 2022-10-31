
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
