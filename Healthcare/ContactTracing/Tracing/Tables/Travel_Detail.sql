CREATE TABLE [Tracing].[Travel_Detail] (
   [Travel_Detail_ID]      VARCHAR(30)  NOT NULL,
   [Travel_Type_ID]        VARCHAR(20)  NULL,
   [Entity_ID]             VARCHAR(30)  NULL,
   [Entity_Type_ID]        VARCHAR(20)  NULL,
   [Travel_Number]         VARCHAR(20)  NULL,
   [Origin_ID]             VARCHAR(20)  NULL,
   [Destination_ID]        VARCHAR(20)  NULL,
   [Travel_Parent_ID]      VARCHAR(30)  NULL,
   [Arrival_DateTime]      DATETIMEOFFSET NULL,

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

   CONSTRAINT [PK_TravelDetail] PRIMARY KEY CLUSTERED ([Travel_Detail_ID] ASC),
   CONSTRAINT [FK_TravelDetail_Contact] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Contact] ([Contact_ID]),
   CONSTRAINT [FK_TravelDetail_Person] FOREIGN KEY ([Entity_ID]) 
      REFERENCES [Entity].[Person] ([Person_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'By Air, By Train, By Ship',
   @level0type = N'SCHEMA',   @level0name = N'Tracing',
   @level1type = N'TABLE',    @level1name = N'Travel_Detail',
   @level2type = N'COLUMN',   @level2name = 'Travel_Type_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'PersonID, ContactID',
   @level0type = N'SCHEMA',   @level0name = N'Tracing', 
   @level1type = N'TABLE',    @level1name = N'Travel_Detail', 
   @level2type = N'COLUMN',   @level2name = 'Entity_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Person, Contact', 
   @level0type = N'SCHEMA',   @level0name = N'Tracing',
   @level1type = N'TABLE',    @level1name = N'Travel_Detail',
   @level2type = N'COLUMN',   @level2name = 'Entity_Type_ID';

