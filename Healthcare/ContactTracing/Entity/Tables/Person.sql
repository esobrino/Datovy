CREATE TABLE [Entity].[Person] (
   [Person_ID]                       VARCHAR(30)  NOT NULL,
   [Alternate_ID]                    VARCHAR(40)  NULL,
   [Type_ID]                         VARCHAR(30)  NULL,
   [Birth_DateTime]                  DATETIMEOFFSET NULL,
   [Birth_Date]                      DATE NULL,
   [Birth_Date_Text]                 VARCHAR(50)  NULL,
   [Birth_Location_ID]               VARCHAR(30)  NULL,
   [Name_Given]                      VARCHAR(80)  NULL,
   [Name_Middle]                     VARCHAR(80)  NULL,
   [Name_Family]                     VARCHAR(80)  NULL,
   [Name_Prefix_Code_ID]             VARCHAR(30)  NULL,
   [Name_Suffix_Code_ID]             VARCHAR(30)  NULL,
   [Name_Full]                       VARCHAR(128) NULL,
   [Sex_Birth_Code_ID]               VARCHAR(30)  NULL,
   [Sex_Code_ID]                     VARCHAR(30)  NULL,
   [Gender_Identity_Code_ID]         VARCHAR(30)  NULL,
   [Sexual_Orientation_Code_ID]      VARCHAR(30)  NULL,
   [Height]                          INT          NULL,
   [Height_Unit_Code]                VARCHAR(30)  NULL,
   [Weight]                          INT          NULL,
   [Weight_Unit_Code]                VARCHAR(30)  NULL,
   [Ethnicity_Code_ID]               VARCHAR(30)  NULL,
   [Race_Code_ID]                    VARCHAR(30)  NULL,
   [Language_Primary_ID]             VARCHAR(30)  NULL,
   [Language_Secondary_ID]           VARCHAR(30)  NULL,
   [Education_Level_Highest_Code_ID] VARCHAR(30)  NULL,

   [Status_Code_ID]                  VARCHAR(30)  NULL,
   [Status_DateTime]                 DATETIMEOFFSET NULL,

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

   CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([Person_ID] ASC),
   CONSTRAINT [FK_Person_PersonType ] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Person_Type] ([Code_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Sex at Birth: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Sex_Birth_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Current Sex Code: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person', 
   @level2type = N'COLUMN',   @level2name = 'Sex_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'The person identifies the Identity as', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Gender_Identity_Code_ID';
GO
