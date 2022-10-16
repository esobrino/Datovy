CREATE TABLE [Entity].[Identification]
(
   [Entity_ID]             VARCHAR(30) NOT NULL,
   [Entity_Type]           VARCHAR(30) NOT NULL,

   [Identification_ID]     VARCHAR(30) PRIMARY KEY,
   [Identification_Number] VARCHAR(80) NOT NULL,
   [Identification_Type]   VARCHAR(20) NULL,
   [Class_Code]            VARCHAR(20) NULL,
   [Enacted_DateTime]      DATETIMEOFFSET NULL,
   [Expiration_DateTime]   DATETIMEOFFSET NULL,
   [Jurisdiction_Code]     INT NOT NULL DEFAULT 0,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   
   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Efective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Efective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT FK_Identification_Type FOREIGN KEY (Entity_Type)
      REFERENCES Entity.Identification_Type(Type_ID)
)
GO
