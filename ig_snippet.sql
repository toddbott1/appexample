begin
	if :APEX$ROW_STATUS = 'C' then
		-- Add record to shares table. Pop message at end of save operation indicating that newly added shares must be accepted (required target user to login) before they will show in this list
		DBMS_OUTPUT.PUT_LINE('C received');
	elseif :APEX$ROW_STATUS = 'U' then
		-- Updates the privs_id of current item record. CHeck if it was only the privs that changed (if user changed, that is a new share!)
		DBMS_OUTPUT.PUT_LINE('U received');
	elseif :APEX$ROW_STATUS = 'D' then
		-- Finds data_id of the current item (!!!!!this really should be passed to the form!). Finds item record by user_id (hidden column in IG) and data_id. Sets the privs_id of the found item to null
		DBMS_OUTPUT.PUT_LINE('D received');
	else
		-- Call this JS - apex.region("REGIONNAME").widget().interactiveGrid("getActions").invoke("save")
		DBMS_OUTPUT.PUT_LINE('Other received');
	end if;
end;
