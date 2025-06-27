CREATE PROCEDURE [dbo].[sp_upsert_file_status] (
	-- Add the parameters for the stored procedure here
	
	@var_file_status_id [VARCHAR](20),
	@var_detailed_info  [NVARCHAR](45) = NULL,
	@var_is_active [tinyint] = NULL,
	@var_sort_order [int] = NULL,
	@var_group [VARCHAR](20),
	@var_date [datetime] = NULL,
	@var_key_status [int] = NULL
)
AS

--SET Values from the database if they are not passed in

SELECT 
	@var_detailed_info = ISNULL(@var_detailed_info , [detailed_info]),
	@var_is_active = ISNULL (@var_is_active, [is_active]),
	@var_sort_order = ISNULL (@var_sort_order, [sort_order]),
	@var_group = ISNULL (@var_group, [group_name])

FROM [dbo].[file_status] 
WHERE [file_status_id] = @var_file_status_id AND [group_name] = @var_group

SET @var_date = (ISNULL ( @var_date, (CAST(GETDATE() AS datetimeoffset(7))) ))
SET	@var_detailed_info = ISNULL(@var_detailed_info,'DESC')
SET	@var_is_active = ISNULL(@var_is_active,'2')
SET @var_sort_order = ISNULL(@var_sort_order,'9')
SET	@var_group = ISNULL (@var_group,'DEFAULT')
SET	@var_key_status = ISNULL (@var_key_status,'1')
SET NOCOUNT ON;

BEGIN TRAN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	UPDATE [dbo].[file_status]

	SET

		 [detailed_info] = @var_detailed_info
		,[is_active] = @var_is_active
		,[updated_at] = @var_date
		,[sort_order] = @var_sort_order
		,[group_name] = @var_group
		,[key_status] = @var_key_status

		--,= @var_date  
		
		WHERE [file_status_id] = @var_file_status_id AND [group_name] = @var_group
 
 IF @@ROWCOUNT = 0

 /* If no values are updated then insert Values into the lei dat table  */
BEGIN 
	INSERT INTO [dbo].[file_status] (
		
		[file_status_id],
		[detailed_info],
		[updated_at],
		[created_at],
		[is_active],
		[sort_order],
		[group_name],
		[key_status]

	)
	VALUES (
		@var_file_status_id,
		@var_detailed_info,  	
		@var_date,
		@var_date,
		@var_is_active,
		@var_sort_order,
		@var_group,
		@var_key_status
	)

END

COMMIT TRAN;
