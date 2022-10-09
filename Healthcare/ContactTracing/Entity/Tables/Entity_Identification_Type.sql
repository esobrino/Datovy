
CREATE TABLE [Entity].[Entity_Identification_Type]
(
   [Type_ID]               VARCHAR(30) PRIMARY KEY,
   [Description]           VARCHAR(80),
   [Tags]                  VARCHAR(128),

   [Tenant_ID]             VARCHAR(30) NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL
)
GO
