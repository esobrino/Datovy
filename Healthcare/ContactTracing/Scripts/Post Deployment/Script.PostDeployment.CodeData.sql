﻿
-- DEFINE PRIVACY TAGS INCLUDING:
--    HIPAA - Health Insurance Portability and Accountability Act
--    GDPR  - General Data Protection Regulation

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Core', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sex_Code_ID';

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Core', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'GenderIdentity_Code_ID';

EXECUTE sp_addextendedproperty
   @name = N'PRIVACY', 
   @value = 'GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Core', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'SexualOrientation_Code_ID';

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
