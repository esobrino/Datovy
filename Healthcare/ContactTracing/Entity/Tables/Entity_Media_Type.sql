﻿CREATE TABLE [Entity].[Entity_Media_Type]
(
   [Type_ID]               VARCHAR(30) PRIMARY KEY,
   [Description]           VARCHAR(80),

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NOT NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NOT NULL
)
GO