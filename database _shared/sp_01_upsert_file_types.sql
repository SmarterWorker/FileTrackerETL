CREATE PROCEDURE [dbo].[sp_upsert_file_types] (
	-- Add the parameters for the stored procedure here
	
	@var_file_type_id [VARCHAR](20),
	@var_detailed_info  [NVARCHAR](45),
	@var_ft_cfg_ref [VARCHAR](20),
	@var_is_active [tinyint],
	@var_date [datetime] = NULL
)
AS

--SET Values from the database if they are not passed in

SELECT 
	@var_detailed_info = ISNULL(@var_detailed_info , [detailed_info]),
	@var_is_active = ISNULL (@var_is_active, [is_active]),
	@var_ft_cfg_ref = ISNULL (@var_ft_cfg_ref, [ft_cfg_ref])

FROM [dbo].[file_types] 
WHERE [file_type_id] = @var_file_type_id

SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET NOCOUNT ON;
-- SELECT (CAST(GETDATE() AS datetimeoffset(7)))
BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	UPDATE [dbo].[file_types]

	SET
		 [detailed_info] = @var_detailed_info
		,[is_active] = @var_is_active
		,[ft_cfg_ref] = @var_ft_cfg_ref
		,[updated_at] = @var_date

	WHERE [file_type_id] = @var_file_type_id
 
 IF @@ROWCOUNT = 0

 /* If no values are updated then insert Values into the lei dat table  */
BEGIN 
	INSERT INTO [dbo].[file_types] (
		
		[file_type_id],
		[detailed_info],
		[ft_cfg_ref],
		[updated_at],
		[created_at],
		[is_active]

	)
	VALUES (
		@var_file_type_id,
		@var_detailed_info,
		@var_ft_cfg_ref,
		@var_date,
		@var_date,
		@var_is_active
	)

END

COMMIT TRAN;
