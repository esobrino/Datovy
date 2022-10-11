
-- DEFINE PRIVACY TAGS INCLUDING:
--    HIPAAnnn - Health Insurance Portability and Accountability Act
--    GDPR     - General Data Protection Regulation
--    PII      - Person Identifiable Information
--    NIST_PII - Person Identifiable Information

-- Person Name Components
EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Given';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Middle';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST_PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Family';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Full';
GO

-- Gender Sex Details
EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sex_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Gender_Identity_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sexual_Orientation_Code_ID';
GO

-- Person Dates
EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_DateTime';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_Date_Text';
GO

-- Person Race - Ethnicity
EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Ethnicity_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Race_Code_ID';
GO

-- Phone Numbers (see/use Communication Type table Tags column)




/*
INSERT INTO Code.Entity_Identification_Type (Type_ID, Description) VALUES
   ('SSN',  'Social Security Number'),
   ('DLIC', 'Driver License Number'),
   ('PPN',  'Passport Number')
GO

INSERT INTO Code.Entity_Uri_Type (Type_ID, Description) VALUES
   ('PEMAIL', 'Personal Email'),
   ('WEMAIL', 'Work Email'),
   ('PWS',    'Personal Web Site'),
   ('WWS',    'Work Web Site')
GO

INSERT INTO Code.Entity_Media_Type (Type_ID, Description) VALUES
   ('UNKWN',      'Not Defined')
GO


INSERT INTO Code.Entity_Communication_Type (Type_ID, Description) VALUES
   ('HOME',      'Home Telephone Number'),
   ('WORK',      'Work Telephone Number'),
   ('MOBILE',    'Mobile Telephone Number'),
   ('EMERGENCY', 'Emergency Telephone Number'),
   ('PAGER',     'Pager Telephone Number'),
   ('TEXT',      'Text Telephone Number (SMS)'),
   ('SCHOOL',    'School Telephone Number'),
   ('CUSTODIAN', 'Custodian Telephone Number'),
   ('FACSIMILE', 'Fax Telephone Number'),
   ('OTHER',     'Other Telephone Number (please specify)')
GO
 */
