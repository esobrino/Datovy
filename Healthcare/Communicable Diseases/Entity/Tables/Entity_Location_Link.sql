﻿CREATE TABLE [Entity].[Entity_Location_Link] (
   [Location_Link_ID]      VARCHAR (30) NOT NULL,
   [Location_ID]           VARCHAR (30) NULL,

   -- core object relationship
   [Activity_ID]           VARCHAR (30) NULL,

   CONSTRAINT [fk_Entity_Location_Link_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),

   -- healthcare relationship 
   [Provider_ID]           VARCHAR (30) NULL,

   CONSTRAINT [fk_Entity_Location_Link_Provider] FOREIGN KEY ([Provider_ID])
      REFERENCES [Healthcare].[Provider] ([Provider_ID]),

   -- entity relationship (only one should be instantiated)
   [Entity_Type_ID]        VARCHAR(30) NULL,
   [Person_ID]             VARCHAR(30) NULL,
   [Organization_ID]       VARCHAR(30) NULL,
   [Officer_ID]            VARCHAR(30) NULL,
   [Contact_ID]            VARCHAR(30) NULL,

   CONSTRAINT [fk_Entity_Location_Link_Entity_Type] FOREIGN KEY ([Entity_Type_ID])
      REFERENCES [Entity].[Entity_Type]([Type_ID]),
   CONSTRAINT [fk_Entity_Location_Link_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Entity_Location_Link_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT [fk_Entity_Location_Link_Officer] FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT [fk_Entity_Location_Link_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID]),

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

   CONSTRAINT [pk_Entity_Location_Link] PRIMARY KEY CLUSTERED ([Location_Link_ID] ASC),

   CONSTRAINT [fk_Entity_Location_Link_Location] FOREIGN KEY ([Location_ID])
      REFERENCES [Core].[Location] ([Location_ID])
);