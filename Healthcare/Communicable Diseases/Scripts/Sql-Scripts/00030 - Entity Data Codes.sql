
-- HL7 Name Types
-- https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.810

-- Type_ID     - contains a local application Name Type ID.
-- Description - contains the "Concept Name" that so far correspond to "Prefered Concept Name"
-- Category_ID - is used for the "Concept Code"

INSERT INTO [Entity].[Name_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('C','Adopted Name','Name type (HL7)'),
   ('A','Alias Name','Name type (HL7)'),
   ('K','Artist Name','Name type (HL7)'),
   ('S','Coded Pseudo-Name to ensure anonymity','Name type (HL7)'),
   ('D','Display Name','Name type (HL7)'),
   ('T','Indigenous/Tribal/Community Name','Name type (HL7)'),
   ('L','Legal Name','Name type (HL7)'),
   ('I','Licensing Name','Name type (HL7)'),
   ('M','Maiden Name','Name type (HL7)'),
   ('B','Name at Birth','Name type (HL7)'),
   ('P','Name of Partner/Spouse (retained for backward compatibility only)','Name type (HL7)'),
   ('N','Nickname /_Call me_ Name/Street Name','Name type (HL7)'),
   ('R','Registered Name (animals only)','Name type (HL7)'),
   ('U','Unspecified','Name type (HL7)')
GO

-- update this so we know where the code came from...
UPDATE [Entity].[Name_Type]
   SET Data_Owner_ID = 'HL7',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- HL7 Race Code
INSERT INTO [Entity].[Race_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('1002-5', 'American Indian or Alaska Native', 'Race - CDC'),
   ('2028-9', 'Asian', 'Race - CDC'),
   ('2054-5', 'Black or African American', 'Race - CDC'),
   ('2076-8', 'Native Hawaiian or Other Pacific Islander', 'Race - CDC'),
   ('2131-1', 'Other Race', 'Race - CDC'),
   ('2106-3', 'White', 'Race - CDC'),
   ('unknown', 'unknown', 'Race - CDC')
GO

-- update this so we know where the code came from...
UPDATE [Entity].[Race_Code]
   SET Data_Owner_ID = 'HL7',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- HL7 Ethnicity Code
INSERT INTO [Entity].[Ethnicity_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('2135-2', 'Hispanic or Latino', 'Ethnicity - CDC'),
   ('2186-5', 'Not Hispanic or Latino', 'Ethnicity - CDC'),
   ('OTH', 'other', 'Ethnicity - HL7'),
   ('UNK', 'unknown', 'Ethnicity - HL7')
GO

-- update this so we know where the code came from...
UPDATE [Entity].[Ethnicity_Code]
   SET Data_Owner_ID = 'HL7',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- HL7 Sex Code
INSERT INTO [Entity].[Sex_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('F', 'Female', 'Administrative sex (HL7)'),
   ('M', 'Male', 'Administrative sex (HL7)'),
   ('U', 'Unknown', 'Administrative sex (HL7)')
GO

-- update this so we know where the code came from...
UPDATE [Entity].[Ethnicity_Code]
   SET Data_Owner_ID = 'HL7',
       Agency_Reporting_ID = 'HL7',
       Version_Number = 'v1'
GO


