
-- Blood Product Code v1
INSERT INTO [Clinical].[Blood_Product_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('OTH','other','NullFlavor'),
   ('256400005','Plasma product (product)','SNOMED-CT'),
   ('256395009','Platelet product (product)','SNOMED-CT'),
   ('126242007','Red blood cells, blood product (product)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Blood_Product_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Indicator Flag Code
INSERT INTO [Clinical].[Indicator_Flag_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('Y','Yes','INDICATOR-FLAG'),
   ('N','No','INDICATOR-FLAG'),
   ('U','Unknown','INDICATOR-FLAG')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Indicator_Flag_Code]
   SET Data_Owner_ID = 'COMMON',
       Agency_Reporting_ID = 'COMMON',
       Version_Number = 'v1'
GO

-- PHVS Laboratory Types Arboviral - CDC - v2
INSERT INTO [Clinical].[Lab_Test_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('LAB721','Arboviral antigen','PHIN Questions'),
   ('LAB611','Arbovirus CSF IgM','PHIN Questions'),
   ('LAB613','Arbovirus CSF PCR','PHIN Questions'),
   ('LAB612','Arbovirus CSF PRNT','PHIN Questions'),
   ('LAB621','Arbovirus IgM','PHIN Questions'),
   ('LAB618','Arbovirus Immunohistochemical Staining','PHIN Questions'),
   ('LAB622','Arbovirus PCR','PHIN Questions'),
   ('LAB623','Arbovirus PRNT','PHIN Questions'),
   ('LAB624','Arbovirus Serum IgM','PHIN Questions'),
   ('LAB610','Arbovirus Serum PCR or NAT','PHIN Questions'),
   ('LAB625','Arbovirus Serum PRNT','PHIN Questions')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Test_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v6'
GO

-- PHVS Specimen Type Arboviral - CDC - v1
INSERT INTO [Clinical].[Specimen_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('429881000124104','Acute phase serum specimen','SNOMED-CT'),
   ('119373006','Amniotic fluid specimen','SNOMED-CT'),
   ('119297000','Blood specimen','SNOMED-CT'),
   ('309051001','Body fluid sample','SNOMED-CT'),
   ('258450006','Cerebrospinal fluid sample','SNOMED-CT'),
   ('429891000124101','Convalescent phase serum specimen','SNOMED-CT'),
   ('122556008','Cord blood specimen','SNOMED-CT'),
   ('110968003','Fetal cytologic material','SNOMED-CT'),
   ('309502007','Fetus specimen','SNOMED-CT'),
   ('119342007','Saliva specimen','SNOMED-CT'),
   ('119347001','Seminal fluid specimen','SNOMED-CT'),
   ('119364003','Serum specimen','SNOMED-CT'),
   ('119403008','Specimen from placenta','SNOMED-CT'),
   ('119376003','Tissue specimen','SNOMED-CT'),
   ('128157004','Tissue specimen from brain','SNOMED-CT'),
   ('122575003','Urine specimen','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Test_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Lab Result Type - CDC - v1
INSERT INTO [Clinical].[Lab_Result_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('42425007','Equivocal (qualifier value)','SNOMED-CT'),
   ('260385009','Negative (qualifier value)','SNOMED-CT'),
   ('10828004','Positive (qualifier value)','SNOMED-CT'),
   ('373121007','Test not done (qualifier value)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Result_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Lab Type - CDC - v1
INSERT INTO [Clinical].[Lab_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC412','CDC Laboratory','PHIN VS (CDC Local Coding)'),
   ('PHC645','Commercial laboratory','PHIN VS (CDC Local Coding)'),
   ('PHC414','State Laboratory','PHIN VS (CDC Local Coding)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- CDC  PHVS Notifiable Event Disease Condition CDC Code v35
INSERT INTO [Clinical].[Disease_Condition_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('50225','Acanthamoeba disease (excluding keratitis)','PH_NEDC - CDC'),
   ('11120','Acute flaccid myelitis','PH_NEDC - CDC'),
   ('11090','Anaplasma phagocytophilum','PH_NEDC - CDC'),
   ('10350','Anthrax','PH_NEDC - CDC'),
   ('12010','Babesiosis','PH_NEDC - CDC'),
   ('50226','Balamuthia mandrillaris disease','PH_NEDC - CDC'),
   ('11910','Blastomycosis','PH_NEDC - CDC'),
   ('10530','Botulism, foodborne','PH_NEDC - CDC'),
   ('10540','Botulism, infant','PH_NEDC - CDC'),
   ('10550','Botulism, other (includes wound)','PH_NEDC - CDC'),
   ('10548','Botulism, other unspecified','PH_NEDC - CDC'),
   ('10549','Botulism, wound','PH_NEDC - CDC'),
   ('10020','Brucellosis','PH_NEDC - CDC'),
   ('10058','Cache Valley virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10066','Cache Valley virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11718','California encephalitis virus disease','PH_NEDC - CDC'),
   ('10054','California serogroup virus diseases, neuroinvasive','PH_NEDC - CDC'),
   ('10061','California serogroup virus diseases, nonneuroinvasive','PH_NEDC - CDC'),
   ('11020','Campylobacteriosis','PH_NEDC - CDC'),
   ('50263','Candida auris, clinical','PH_NEDC - CDC'),
   ('50264','Candida auris, colonization/screening','PH_NEDC - CDC'),
   ('50244','Carbapenemase-Producing Carbapenem-Resistant Enterobacteriaceae (CP-CRE)','PH_NEDC - CDC'),
   ('32016','Carbon Monoxide Poisoning','PH_NEDC - CDC'),
   ('10273','Chancroid','PH_NEDC - CDC'),
   ('11649','Chapare hemorrhagic fever','PH_NEDC - CDC'),
   ('10073','Chikungunya virus diseases','PH_NEDC - CDC'),
   ('10274','Chlamydia trachomatis infection','PH_NEDC - CDC'),
   ('10470','Cholera (toxigenic Vibrio cholerae O1 or O139)','PH_NEDC - CDC'),
   ('11900','Coccidioidomycosis','PH_NEDC - CDC'),
   ('10093','Colorado tick fever virus disease','PH_NEDC - CDC'),
   ('11065','Coronavirus Disease 2019 (COVID-19)','PH_NEDC - CDC'),
   ('11640','Crimean-Congo hemorrhagic fever','PH_NEDC - CDC'),
   ('11580','Cryptosporidiosis','PH_NEDC - CDC'),
   ('11575','Cyclosporiasis','PH_NEDC - CDC'),
   ('10680','Dengue','PH_NEDC - CDC'),
   ('11705','Dengue, severe','PH_NEDC - CDC'),
   ('11704','Dengue-like illness','PH_NEDC - CDC'),
   ('10040','Diphtheria','PH_NEDC - CDC'),
   ('10053','Eastern equine encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10062','Eastern equine encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('11630','Ebola hemorrhagic fever','PH_NEDC - CDC'),
   ('11088','Ehrlichia chaffeensis','PH_NEDC - CDC'),
   ('11089','Ehrlichia ewingii','PH_NEDC - CDC'),
   ('11091','Ehrlichiosis/Anaplasmosis, undetermined','PH_NEDC - CDC'),
   ('11566','Enterotoxigenic E.coli (ETEC)','PH_NEDC - CDC'),
   ('50237','Flavivirus disease, not otherwise specified','PH_NEDC - CDC'),
   ('11570','Giardiasis','PH_NEDC - CDC'),
   ('10280','Gonorrhea','PH_NEDC - CDC'),
   ('11648','Guanarito hemorrhagic fever','PH_NEDC - CDC'),
   ('10590','Haemophilus influenzae, invasive disease','PH_NEDC - CDC'),
   ('10380','Hansen disease (Leprosy)','PH_NEDC - CDC'),
   ('11610','Hantavirus infection, non-Hantavirus Pulmonary Syndrome','PH_NEDC - CDC'),
   ('11590','Hantavirus pulmonary syndrome','PH_NEDC - CDC'),
   ('11550','Hemolytic uremic syndrome postdiarrheal','PH_NEDC - CDC'),
   ('10110','Hepatitis A, acute','PH_NEDC - CDC'),
   ('10105','Hepatitis B, virus infection, chronic','PH_NEDC - CDC'),
   ('10100','Hepatitis B, acute','PH_NEDC - CDC'),
   ('10104','Hepatitis B, perinatal infection','PH_NEDC - CDC'),
   ('10101','Hepatitis C, acute','PH_NEDC - CDC'),
   ('10106','Hepatitis C, Chronic','PH_NEDC - CDC'),
   ('50248','Hepatitis C, perinatal infection','PH_NEDC - CDC'),
   ('10103','Hepatitis E, acute','PH_NEDC - CDC'),
   ('11915','Histoplasmosis','PH_NEDC - CDC'),
   ('11061','Influenza-associated pediatric mortality','PH_NEDC - CDC'),
   ('11723','Invasive pneumococcal disease','PH_NEDC - CDC'),
   ('10079','Jamestown Canyon virus disease, non-neuroinvasive','PH_NEDC - CDC'),
   ('10078','Jamestown Canyon virus, neuroinvasive disease','PH_NEDC - CDC'),
   ('10059','Japanese encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10068','Japanese encephalitis virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11638','Junín hemorrhagic fever','PH_NEDC - CDC'),
   ('11712','Keystone virus disease','PH_NEDC - CDC'),
   ('10081','La Crosse virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10082','LaCrosse virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11632','Lassa fever','PH_NEDC - CDC'),
   ('50258','Latent TB infection','PH_NEDC - CDC'),
   ('10490','Legionellosis','PH_NEDC - CDC'),
   ('10390','Leptospirosis','PH_NEDC - CDC'),
   ('10640','Listeriosis','PH_NEDC - CDC'),
   ('11644','Lujo virus','PH_NEDC - CDC'),
   ('11080','Lyme disease','PH_NEDC - CDC'),
   ('11637','Machupo hemorrhagic fever','PH_NEDC - CDC'),
   ('10130','Malaria','PH_NEDC - CDC'),
   ('11631','Marburg fever','PH_NEDC - CDC'),
   ('10140','Measles (rubeola)','PH_NEDC - CDC'),
   ('10150','Meningococcal disease (Neisseria meningitidis)','PH_NEDC - CDC'),
   ('11066','Multisystem Inflammatory Syndrome (MIS) associated with Coronavirus Disease 2019 (COVID-19)','PH_NEDC - CDC'),
   ('10180','Mumps','PH_NEDC - CDC'),
   ('50227','Naegleria fowleri causing Primary Amebic Meningoencephalitis','PH_NEDC - CDC'),
   ('50261','Neonatal sepsis','PH_NEDC - CDC'),
   ('11062','Novel influenza A virus infections, initial detections of','PH_NEDC - CDC'),
   ('10072','Other Arboviral diseases, not otherwise specified','PH_NEDC - CDC'),
   ('10190','Pertussis','PH_NEDC - CDC'),
   ('10440','Plague','PH_NEDC - CDC'),
   ('10410','Poliomyelitis, paralytic','PH_NEDC - CDC'),
   ('10405','Poliovirus infection, nonparalytic','PH_NEDC - CDC'),
   ('10057','Powassan virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10063','Powassan virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10450','Psittacosis (Ornithosis)','PH_NEDC - CDC'),
   ('10257','Q fever, acute','PH_NEDC - CDC'),
   ('10258','Q fever, chronic','PH_NEDC - CDC'),
   ('10340','Rabies, animal','PH_NEDC - CDC'),
   ('10460','Rabies, human','PH_NEDC - CDC'),
   ('11646','Respiratory Syncytial Virus-Associated Deaths','PH_NEDC - CDC'),
   ('10200','Rubella','PH_NEDC - CDC'),
   ('10370','Rubella, congenital syndrome','PH_NEDC - CDC'),
   ('11639','Sabia-associated hemorrhagic fever','PH_NEDC - CDC'),
   ('50267','Salmonella enterica serotype Typhi (S.Typhi) infection)','PH_NEDC - CDC'),
   ('50266','Salmonella enterica serotypes Paratyphi A, B (tartrate negative) and C (S. Paratyphi) infection','PH_NEDC - CDC'),
   ('50265','Salmonellosis (excluding S. Typhi infection and S. Paratyphi infection)','PH_NEDC - CDC'),
   ('10575','Severe Acute Respiratory Syndrome (SARS)-associated Coronavirus disease (SARS-CoV)','PH_NEDC - CDC'),
   ('11563','Shiga toxin-producing Escherichia coli (STEC)','PH_NEDC - CDC'),
   ('11010','Shigellosis','PH_NEDC - CDC'),
   ('11800','Smallpox','PH_NEDC - CDC'),
   ('11734','Snowshoe hare virus disease','PH_NEDC - CDC'),
   ('10250','Spotted Fever Rickettsiosis','PH_NEDC - CDC'),
   ('10051','St. Louis encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10064','St. Louis encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('11710','Streptococcal disease, invasive, Group A  (Streptococcus pyogenes)','PH_NEDC - CDC'),
   ('11715','Streptococcal disease, invasive, Group B  (Streptococcus agalactiae)','PH_NEDC - CDC'),
   ('11700','Streptococcal toxic shock syndrome','PH_NEDC - CDC'),
   ('10316','Syphilis, congenital','PH_NEDC - CDC'),
   ('10313','Syphilis, early non-primary, non-secondary','PH_NEDC - CDC'),
   ('10311','Syphilis, primary','PH_NEDC - CDC'),
   ('10312','Syphilis, secondary','PH_NEDC - CDC'),
   ('10310','Syphilis, total primary and secondary','PH_NEDC - CDC'),
   ('10320','Syphilis, unknown duration or late','PH_NEDC - CDC'),
   ('10210','Tetanus','PH_NEDC - CDC'),
   ('10074','Tick-borne Encephalitis viruses','PH_NEDC - CDC'),
   ('10520','Toxic-shock syndrome (other than streptococcal)','PH_NEDC - CDC'),
   ('10270','Trichinellosis','PH_NEDC - CDC'),
   ('11724','Trivittatus virus disease','PH_NEDC - CDC'),
   ('10220','Tuberculosis','PH_NEDC - CDC'),
   ('10230','Tularemia','PH_NEDC - CDC'),
   ('11663','Vancomycin-intermediate Staphylococcus aureus (VISA)','PH_NEDC - CDC'),
   ('11665','Vancomycin-resistant Staphylococcus aureus (VRSA)','PH_NEDC - CDC'),
   ('10030','Varicella (Chickenpox)','PH_NEDC - CDC'),
   ('10055','Venezuelan equine encephalitis virus neuroinvasive disease','PH_NEDC - CDC'),
   ('10067','Venezuelan equine encephalitis virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11545','Vibriosis (any species of the family Vibrionaceae, other than toxigenic Vibrio cholerae O1 or O139)','PH_NEDC - CDC'),
   ('10056','West Nile virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10049','West Nile virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10052','Western equine encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10065','Western equine encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10660','Yellow fever','PH_NEDC - CDC'),
   ('11565','Yersiniosis (non-pestis)','PH_NEDC - CDC'),
   ('50224','Zika virus disease, congenital','PH_NEDC - CDC'),
   ('50223','Zika virus disease, non-congenital','PH_NEDC - CDC'),
   ('50222','Zika virus infection, congenital','PH_NEDC - CDC'),
   ('50221','Zika virus infection, non-congenital','PH_NEDC - CDC')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Disease_Condition_Code]
   SET Category_ID = 'Public Health',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = '35'
GO

-- PHVS Clinical Syndrome Arbovirus - CDC - v7
INSERT INTO [Clinical].[Clinical_Syndrome_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('84387000','Asymptomatic','SNOMED-CT'),
   ('416113008','Febrile disorder','SNOMED-CT'),
   ('7180009','Meningitis','SNOMED-CT'),
   ('PHC638','Encephalitis Including Meningoencephalitis','PHIN VS (CDC Local Coding System)'),
   ('698293005','Acute flaccid paralysis','SNOMED-CT'),
   ('40956001','Guillain-Barre Syndrome','SNOMED-CT'),
   ('PHC639','Hepatitis and or Jaundice','PHIN VS (CDC Local Coding System)'),
   ('57653000','Multiple organ failure','SNOMED-CT'),
   ('OTH','Other','NullFlavor'),
   ('PHC1457','Other Neuroinvasive Presentation','PHIN VS (CDC Local Coding System)'),
   ('38362002','Dengue','SNOMED-CT'),
   ('PHC1459','Dengue-like illness','PHIN VS (CDC Local Coding System)'),
   ('PHC1458','Severe Dengue','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('82353009','Congenital infectious','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Clinical_Syndrome_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v7'
GO


-- PHVS Clinical Syndrome Secondary - Arboviral - CDC - v2
INSERT INTO [Clinical].[Clinical_Syndrome_Secondary_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('260413007','None','SNOMED-CT'),
   ('7180009','Meningitis','SNOMED-CT'),
   ('PHC638','Encephalitis Including Meningoencephalitis','PHIN VS (CDC Local Coding System)'),
   ('698293005','Acute flaccid paralysis ','SNOMED-CT'),
   ('40956001','Guillain-Barre Syndrome','SNOMED-CT'),
   ('PHC639','Hepatitis and or Jaundice','PHIN VS (CDC Local Coding System)'),
   ('57653000','Multiple organ failure','SNOMED-CT'),
   ('OTH','Other','NullFlavor'),
   ('PHC1457','Other Neuroinvasive Presentation','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Clinical_Syndrome_Secondary_Code]
   SET Caegory_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO


-- PHVS Disease Acquired Jurisdiction - CDC - v3
INSERT INTO [Clinical].[Disease_Acquired_Jurisdiction_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC244','Indigenous, within jurisdiction','PHIN VS (CDC Local Coding System)'),
   ('C1512888','International','UMLS'),
   ('PHC245','Out of jurisdiction, from another jurisdiction within state','PHIN VS (CDC Local Coding System)'),
   ('PHC246','Out of state','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('PHC1274','Yes imported, but not able to determine source state and/or country','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Disease_Acquired_Jurisdiction_Code]
   SET [Category_ID] = '',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Virus Type - Arboviral - CDC - v3
INSERT INTO [Clinical].[Disease_Acquired_Jurisdiction_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('764949001','Alkhurma virus (organism)','SNOMED-CT'),
   ('281165003','Arbovirus (organism)','SNOMED-CT'),
   ('56932004','Barmah Forest virus (organism)','SNOMED-CT'),
   ('764948009','Bourbon virus (organism)','SNOMED-CT'),
   ('31546004','Cache Valley virus (organism)','SNOMED-CT'),
   ('64979004','California encephalitis virus (organism)','SNOMED-CT'),
   ('243617008','California serogroup Orthobunyavirus (organism)','SNOMED-CT'),
   ('2423009','Chikungunya virus (organism)','SNOMED-CT'),
   ('34212000','Colorado tick fever virus (organism)','SNOMED-CT'),
   ('34348001','Dengue virus (organism)','SNOMED-CT'),
   ('243601002','Eastern equine encephalitis virus (organism)','SNOMED-CT'),
   ('28375005','Genus Flavivirus (organism)','SNOMED-CT'),
   ('764947004','Heartland virus (organism)','SNOMED-CT'),
   ('588234111000087104','Highlands J virus (organism)','SNOMED-CT'),
   ('9194001','Jamestown Canyon virus (organism)','SNOMED-CT'),
   ('243603004','Japanese encephalitis virus (organism)','SNOMED-CT'),
   ('61399004','Keystone virus (organism)','SNOMED-CT'),
   ('32137001','Kyasanur Forest disease virus (organism)','SNOMED-CT'),
   ('30434006','La Crosse virus (organism)','SNOMED-CT'),
   ('19874008','Mayaro virus (organism)','SNOMED-CT'),
   ('31989009','Murray Valley encephalitis virus (organism)','SNOMED-CT'),
   ('8905000','O''nyong-nyong virus (organism)','SNOMED-CT'),
   ('33660003','Oropouche virus (organism)','SNOMED-CT'),
   ('45838003','Powassan virus (organism)','SNOMED-CT'),
   ('28335002','Rift Valley fever virus (organism)','SNOMED-CT'),
   ('71518008','Rocio virus (organism)','SNOMED-CT'),
   ('32458000','Ross River virus (organism)','SNOMED-CT'),
   ('58432001','Saint Louis encephalitis virus (organism)','SNOMED-CT'),
   ('30681002','Sindbis virus (organism)','SNOMED-CT'),
   ('28732002','Snowshoe hare virus (organism)','SNOMED-CT'),
   ('6895004','Tahyna virus (organism)','SNOMED-CT'),
   ('32323003','Tick-borne encephalitis virus (organism)','SNOMED-CT'),
   ('51253001','Toscana virus (organism)','SNOMED-CT'),
   ('87919008','Trivittatus virus (organism)','SNOMED-CT'),
   ('85183000','Usutu virus (organism)','SNOMED-CT'),
   ('62958000','Venezuelan equine encephalomyelitis virus (organism)','SNOMED-CT'),
   ('57311007','West Nile virus (organism)','SNOMED-CT'),
   ('11428003','Western equine encephalomyelitis virus (organism)','SNOMED-CT'),
   ('26630006','Yellow fever virus (organism)','SNOMED-CT'),
   ('50471002','Zika virus (organism)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Disease_Acquired_Jurisdiction_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v8'
GO








