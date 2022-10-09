CREATE TABLE [Entity].[Entity_Identification]
(
   [Entity_ID]             VARCHAR(30) NOT NULL,
   Entity_Type             VARCHAR(30) NOT NULL,

   Identification_ID       VARCHAR(30) PRIMARY KEY,
   [Identification_Number] VARCHAR(80) NOT NULL,
   Identification_Type     VARCHAR(20) NULL,
   Class_Code              VARCHAR(20) NULL,
   Enacted_Date            DATE,
   Expiration_Date         DATE,
   Jurisdiction_Code       INT NOT NULL DEFAULT 0,
   
   [Status_Code_ID]        VARCHAR(30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,
   [Start_DateTime]        DATETIMEOFFSET   NULL,
   [End_DateTime]          DATETIMEOFFSET   NULL,
   
   [Tenant_ID]             VARCHAR(30) NOT NULL,
   Data_Owner_ID           VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   Created_DateTime        DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   Record_Status_Code      CHAR(1) NOT NULL DEFAULT 'A',
   Session_Updated_ID      VARCHAR(40),

   CONSTRAINT FK_Entity_Identification_Type FOREIGN KEY (Entity_Type)
      REFERENCES Entity.Entity_Identification_Type(Type_ID)
)
GO
