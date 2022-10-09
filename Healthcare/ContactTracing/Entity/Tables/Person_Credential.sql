
CREATE TABLE Core.Person_Credential
(
  	[Person_ID]             VARCHAR(30) NOT NULL,
   [Credential_ID]         VARCHAR(30) PRIMARY KEY,
   [Credential_Number_ID]  VARCHAR(80) NULL,
   [Type_ID]               VARCHAR(30) NULL,
   [Category_Text]         VARCHAR(80),
   [Class_Code_ID]         VARCHAR(30) NULL,
   [Enacted_DateTime]      DATETIMEOFFSET,
   [Expiration_DateTime]   DATETIMEOFFSET,
   [Jurisdiction_Code_ID]  VARCHAR(30) NULL,

   [Status_Code_ID]        VARCHAR (30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,
   [Start_DateTime]        DATETIMEOFFSET   NULL,
   [End_DateTime]          DATETIMEOFFSET   NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT FK_Person_Credential_Type FOREIGN KEY ([Type_ID])
      REFERENCES [Entity].[Person_Credential_Type]([Type_ID])
);

GO