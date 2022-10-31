--
INSERT INTO [Other].[Case_Transmission_Mode_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('416380006',	 'Airborne transmission',	                'SNOMED-CT'),
   ('409700000',	 'Animal to human transmission',	          'SNOMED-CT'),
   ('420014008',   'Blood borne transmission',	             'SNOMED-CT'),
   ('4.61551E+14', 'Droplet transmission',	                'SNOMED-CT'),
   ('416086007',	 'Food-borne transmission',	             'SNOMED-CT'),
   ('418375005',	 'Indeterminate disease transmission mode','SNOMED-CT'),
   ('PHC142',	    'Mechanical',	                            'PHIN VS (CDC Local Coding System)'),
   ('416085006',	 'Nosocomial transmission',	             'SNOMED-CT'),
   ('OTH',	       'Other',	                               'NullFlavor'), 
   ('417564009',	 'Sexual transmission',	                   'SNOMED-CT'),
   ('420193003',	 'Transdermal transmission',	             'SNOMED-CT'),
   ('417409004',	 'Transplacental transmission',            'SNOMED-CT'),
   ('418427004',	 'Vector-borne transmission',	             'SNOMED-CT'),
   ('418117003',	 'Water-borne transmission',	             'SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Other].[Case_Transmission_Mode_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v6'
GO