-- based on Census Tiger County Table
CREATE TABLE [Geography].[County_Code]
(
   [County_ID]              VARCHAR(40) NOT NULL,

   [State_FIPS]             VARCHAR(2) NOT NULL,
   [County_FIPS]            VARCHAR(3) NOT NULL,
   [County_ANSI]            VARCHAR(8) NOT NULL,
   [GeoID]                  VARCHAR(5) NOT NULL,  -- county ID state+county fips

   [Name]                   VARCHAR(100) NOT NULL,
   [Name_LSAD]              VARCHAR(100) NULL,

   [Area_LSAD]              VARCHAR(2) NULL,      -- legal/stats area code
   [Class_FIPS]             VARCHAR(2) NULL, 
   [Feature_Class_MTF]      VARCHAR(5) NULL,      -- MAF/TIGER feature class code

   [Area_CSAFP]             VARCHAR(3) NULL,      -- combined stat area code
   [Area_CBSAFP]            VARCHAR(5) NULL,      -- metro stat area/micropolitan stat area code
   [Metro_Division_Code]    VARCHAR(5) NULL,
   [Functional_Status]      VARCHAR(1) NULL,

   [Area_Land]              DECIMAL(18, 7) NULL,
   [Area_Water]             DECIMAL(18, 7) NULL,

   [Latitude]               DECIMAL(18, 7) NULL,  -- lat of internal point
   [Longitude]              DECIMAL(18, 7) NULL,  -- lon of internal point

   -- record management
   [Tenant_ID]              VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(30) NULL DEFAULT 'Census',
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '2020',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_County_Code] PRIMARY KEY CLUSTERED ([County_ID] ASC)
)
