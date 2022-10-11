
CREATE TABLE Core.Person_Credential
(
  	[Person_ID]             VARCHAR(30) NOT NULL,
   [Credential_ID]         VARCHAR(30) PRIMARY KEY,
   [Credential_Number_ID]  VARCHAR(80) NULL,
   [Type_ID]               VARCHAR(30) NULL,
   [Category_Text]         VARCHAR(80) NULL,
   [Class_Code_ID]         VARCHAR(30) NULL,
   [Enacted_DateTime]      DATETIMEOFFSET,
   [Expiration_DateTime]   DATETIMEOFFSET,
   [Jurisdiction_Code_ID]  VARCHAR(30) NULL,

   [Status_Code_ID]        VARCHAR (30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

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

   CONSTRAINT FK_Person_Credential_Type FOREIGN KEY ([Type_ID])
      REFERENCES [Entity].[Person_Credential_Type]([Type_ID])
);

GO