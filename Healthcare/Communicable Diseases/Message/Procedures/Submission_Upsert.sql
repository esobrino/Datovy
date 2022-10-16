
-- The following is based on KnowTech Submission Registry

CREATE PROCEDURE Message.Submission_Upsert
-- @SessionID             VARCHAR(40) = '',
   @SubmissionID          VARCHAR(20) = '',   -- unique submission ID (if new will be null or empty)
   @SubmissionDate        VARCHAR(20) = NULL,    -- date and time submission was prepared
   @ReceiveDate           VARCHAR(20) = NULL,    -- received date and time
   @ContentType           VARCHAR(20),        -- content type
   @IncidentID            VARCHAR(20) = NULL, -- Incident ID
   @SourceAgencyID        VARCHAR(20),        -- submitter Agency ID
   @SourceLocalID         VARCHAR(20) = '',   -- e.g. CFS Local ID
   @DataOwnerAgencyID     VARCHAR(20) = '',   -- data owner Agency ID as specified in payload.DataOwner
   @DataItemID            VARCHAR(20) = '',   -- submission DataOwner.DataItemID as specified in payload
   @MessageData           VARCHAR(MAX),       -- CLOB xml message 
   @ContentReferenceID    VARCHAR(20) = '',   -- e.g. GlobalID for CFS
   @OutSubmissionID       VARCHAR(20) OUTPUT
AS
BEGIN
   SET NOCOUNT ON

   IF NOT EXISTS(SELECT * FROM Common.ContentType
                  WHERE ContentType = @ContentType)
      RETURN -4003  -- invalid content-type

   IF @SubmissionDate is null
      SET @SubmissionDate = getdate()
   IF @ReceiveDate is null
      SET @ReceiveDate = getdate()

   -- get year-month from submission date
   DECLARE @ym CHAR(6),
           @fd CHAR(10),
           @dt DATETIME
   SET @fd = convert(varchar(10), @SubmissionDate, 120)
   -- SELECT @fd
   SET @ym = substring(@fd,1,4) + substring(@fd,6,2)
   -- SELECT @ym

   DECLARE @MessageLengthInBytes  INTEGER,
           @rval                  INTEGER
   SET @MessageLengthInBytes = len(@MessageData)

   -- prepare a unique submission id and/or reference id as necessary...
   IF @SubmissionID = '' OR @SubmissionID IS NULL
   BEGIN
      EXEC @rval = Common.IdBaseGetNewPrefixedYmdhmId
           '', @SourceAgencyID, 'SB', @SubmissionID OUTPUT
   END
   SET @OutSubmissionID = @SubmissionID

   IF @DataItemID IS NULL OR @DataItemID = ''
      SET @DataItemID = @OutSubmissionID
   
   -- try to insert submisison now
   --BEGIN TRANSACTION

   IF NOT EXISTS (SELECT * FROM Common.Submission with(nolock)
                   WHERE SubmissionID = @SubmissionID)
   BEGIN

      -- StateNo = 1 = Registered
      INSERT INTO Common.Submission
         ( SubmissionID,     SubmissionDate,        ReceiveDate,
           ContentType,      SourceAgencyID,
           SourceLocalID,    DataOwnerAgencyID,     DataItemID,
           MessageData,      MessageLengthInBytes,  ContentReferenceID,
           MessageCount,     IncidentID,            MessageDateTime)
      VALUES
         (@SubmissionID,    @SubmissionDate,       @ReceiveDate,
          @ContentType,     @SourceAgencyID,
          @SourceLocalID,   @DataOwnerAgencyID,    @DataItemID,
          @MessageData,     @MessageLengthInBytes, @ContentReferenceID,
          1,                @IncidentID,           @ReceiveDate)

      IF @@ERROR <> 0
      BEGIN
         --ROLLBACK TRAN
         RETURN -3001    -- failed inserting submission...
      END
   END
   ELSE
   BEGIN
      UPDATE Common.Submission
         SET MessageCount = MessageCount + 1
       WHERE SubmissionID = @SubmissionID

      IF @@ERROR <> 0
      BEGIN
         --ROLLBACK TRAN
         RETURN -3002    -- failed updating submission count...
      END
   END

   --COMMIT TRANSACTION
END
GO

