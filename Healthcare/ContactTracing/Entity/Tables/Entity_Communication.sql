CREATE TABLE [Entity].[Entity_Communication] (
   [Entity_Communication_ID] VARCHAR (30) NOT NULL,
   [Entity_ID]               VARCHAR (30) NULL,
   [Entity_Type_ID]          VARCHAR (30) NULL,
   [Device_Code_ID]          VARCHAR (30) NULL ,
   [Device_Usage_Code_ID]    VARCHAR (20) NULL,
   [Phone_Country_Code_ID]   VARCHAR (5)  NULL,
   [Phone_Area_Code_ID]      VARCHAR (10) NULL,
   [Phone_Number]            VARCHAR (20) NULL,
   [Extension]               VARCHAR (10) NULL,

   [Status_Code_ID]          VARCHAR (30)  NULL,
   [Status_DateTime]         DATETIMEOFFSET NULL,
   [Start_DateTime]          DATETIMEOFFSET NULL,
   [End_DateTime]            DATETIMEOFFSET NULL,

   [Tenant_ID]               VARCHAR(30) NOT NULL,
   [Data_Owner_ID]           VARCHAR(30) NULL,
   [Agency_Reporting_ID]     VARCHAR(30) NULL,
   [Version_Number]          VARCHAR(20),
   [Sequence_Number]         INTEGER NULL,
   [Created_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]   DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]   CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]      VARCHAR(40),

   CONSTRAINT [PK_Communication] PRIMARY KEY CLUSTERED ([Entity_Communication_ID] ASC),
   CONSTRAINT [FK_Communication_Contact] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID]),
   CONSTRAINT [FK_Communication_Person] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);

GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Phone, Fax', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Entity_Communication', 
   @level2type = N'COLUMN',   @level2name = 'Device_Code_ID';


GO
EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Work, Home, Office', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Entity_Communication',
   @level2type = N'COLUMN',   @level2name = 'Device_Usage_Code_ID';

