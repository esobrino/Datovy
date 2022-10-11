CREATE TABLE [Core].[Location] (
   [Location_ID]               VARCHAR(30) NOT NULL,
   [Alternate_ID]              VARCHAR(40) NULL,
   [Alternate_Type]            VARCHAR(20) NULL, 

   [Location_Type_ID]          VARCHAR(30) NULL,
   [Location_Name]             VARCHAR(80) NULL,
   [Location_Name_Abbr]        VARCHAR(30) NULL,
   [Location_Description]      VARCHAR(128) NULL,

   [Landmark_Text]             VARCHAR(128) NULL,
   [Address_Full_Text]         VARCHAR(128) NULL,
    
   [Address_Text1]             VARCHAR(80) NULL,
   [Address_Text2]             VARCHAR(80) NULL,
   [Address_Text3]             VARCHAR(80) NULL,

   [Building_Name]             VARCHAR(80) NULL,
   [Unit_Number]               VARCHAR(10) NULL,
   [Mailbox]                   VARCHAR(40) NULL,
   
   [Street_Number]             VARCHAR(40) NULL,
   [Street_Name]               VARCHAR(80) NULL,
   [Street_Direction]          VARCHAR(20) NULL,
   [Street_Prefix]             VARCHAR(20) NULL,
   [Street_Suffix]             VARCHAR(20) NULL,
  
   [City_Name]                 VARCHAR(30) NULL,
   [State_Code]                VARCHAR(2) NULL,
   [Postal_Code]               VARCHAR(10) NULL,
   [Postal_Code_Extension]     VARCHAR(4) NULL,
   [Region_Code]               VARCHAR(10) NULL,
   [District_Code]             VARCHAR(30) NULL,
   [Country_Code]              VARCHAR(30) NULL,

   [Latitude]                  DECIMAL(18, 7) NULL,
   [Longitude]                 DECIMAL(18, 7) NULL,

   [Address_Primary_Indicator] CHAR(1) NULL,
   
   [Status_Code_ID]            VARCHAR(30) NULL,
   [Status_DateTime]           DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Start_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [End_DateTime]          DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL,

   CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([Location_ID] ASC)
);


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Facility - outpatient clinic short-term care and can recover at Hospitals refer discharged patients to a network of outpatient clinics that specialize in services for ongoing conditions. Hospital - inpatient clinic long-term care or emergencies or specific medical treatment or specialist.',
   @level0type = N'SCHEMA',   @level0name = N'Core', 
   @level1type = N'TABLE',    @level1name = N'Location', 
   @level2type = N'COLUMN',   @level2name = N'Location_Type_ID';

