procedure post_auth is

	usercount number;

	categorycount number;

    userid number;

BEGIN

	-- Save the returned OAuth/OIDC tokens.

    :G_ACCESS_TOKEN := apex_json.get_varchar2('access_token');

    :G_ID_TOKEN := apex_json.get_varchar2('id_token');

    -- Below do one-time user and category data seeding for new user.

	-- LATER, this probably should be removed from here and added to the JS dialog where new user is prompted

	-- to set their initial vault password. Also, the encryption that is needed below may not be possible

	-- here because the JS crypto library may not be loaded yet!

	-- Start by checking if the user has a record yet.

	select count(*) INTO usercount from pv_users where email = lower(:APP_USER);

	--DBMS_OUTPUT.PUT_LINE('Usercount: ' || usercount);

	if usercount = 0 then

		-- It is a brand new user who has not had a user record created yet, so create one for them.

		-- LATER, should add public/private key generation, private key encryption, and creating private key

		-- in OCI Vault for the new user here.

		INSERT INTO pv_users (email, private_ekey_ref, public_ekey, registered_on, signedin_on) VALUES (lower(:APP_USER), 'privkeyref1-' || lower(:APP_USER), 'pubkey1-' || lower(:APP_USER), SYSTIMESTAMP, SYSTIMESTAMP);

		commit;

	end if;

	-- Now retrieve and save the user's internal ID number.

	select id INTO userid from pv_users where email = lower(:APP_USER);

	:G_INT_USERID := to_char(userid);

	--DBMS_OUTPUT.PUT_LINE('Userid: ' || userid);

	-- Now check if the user has any categories yet.

    select count(*) INTO categorycount from pv_categories where user_id = userid;

    --DBMS_OUTPUT.PUT_LINE('Categorycount: ' || categorycount);

	if categorycount = 0 then

		-- It is a brand new user who has not had categories seeded yet, so create categories for them.

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Personal/Family', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Social/Friends', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Health/Medical', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Home/Housing', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Faith/Religion', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Sports/Exercise/Outdoor', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Automotive/Mobility', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Transportation Services', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('School/Education', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Training/Certification', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Job/Work-Related', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Career/Professional', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Shipping/Delivery', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Travel/Lodging', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Entertainment/Dining', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Finance/Investment', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Insurance Policy', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Core Service/Utility', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Tax Filing/Planning', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Streaming Media/News', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Photo/Memory', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Government Record/ID', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Club/Organization', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Product/Device Info', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Receipt/Confirmation', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Software License', userid, 'en-US', 'UTF-8');

		INSERT INTO pv_categories (title, user_id, locale, charset) VALUES ('Other', userid, 'en-US', 'UTF-8');

    end if;

	commit;

END post_auth;