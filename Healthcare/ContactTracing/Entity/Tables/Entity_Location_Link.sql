CREATE TABLE [Core].[Entity_Location_Link] (
   [Entity_Location_Link_ID] VARCHAR (30) NOT NULL,
   [Person_ID]               VARCHAR (30) NULL,
   [Provider_ID]             VARCHAR (30) NULL,
   [Organization_ID]         VARCHAR (30) NULL,
   [Activity_ID]             VARCHAR (30) NULL,
   [Location_ID]             VARCHAR (30) NULL,

   [Tenant_ID]               VARCHAR(30) NOT NULL,
   [Data_Owner_ID]           VARCHAR(30) NULL,
   [Agency_Reporting_ID]     VARCHAR(30) NULL,
   [Version_Number]          VARCHAR(20),
   [Sequence_Number]         INTEGER NULL,
   [Created_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]   DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]   CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]      VARCHAR(40),

   CONSTRAINT [PK_EntityLocationLink] PRIMARY KEY CLUSTERED ([Entity_Location_Link_ID] ASC),

   CONSTRAINT [FK_Entity_Location_Link_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Entity_Location_Link_Location] FOREIGN KEY ([Location_ID])
      REFERENCES [Core].[Location] ([Location_ID]),
   CONSTRAINT [FK_Entity_Location_Link_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [FK_Entity_Location_Link_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [FK_Entity_Location_Link_Provider] FOREIGN KEY ([Provider_ID])
      REFERENCES [Healthcare].[Provider] ([Provider_ID])
);
