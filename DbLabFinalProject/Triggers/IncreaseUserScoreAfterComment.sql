CREATE TRIGGER ScoreOnComment
ON Comment
AFTER INSERT
AS
  DECLARE @UUId BIGINT
  SELECT @UUId = (SELECT UUId   
  FROM INSERTED)

  DECLARE @CommentScore INT
  SELECT @CommentScore = (SELECT Score   
  FROM INSERTED)

  UPDATE customer
  SET Score = Score + @CommentScore
  WHERE UUId = @UUId;
GO
