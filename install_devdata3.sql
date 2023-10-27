--Before running this script, ensure you have signed into the app at least once with each sample user account (two of them total). Or, you can just run the newuser_setup.sql script for each user to simulate that. Doing so will automatically create a user record and seeded categories for each user.

-- Just to give Jane.Doe an account so the pv_items insertions below will work...

-- INSERT INTO pv_users (EMAIL, PRIVATE_EKEY_REF, PUBLIC_EKEY, REGISTERED_ON, SIGNEDIN_ON) VALUES ('jane.doe@oracle.com', 'privkeyref2', 'pubkey2', SYSTIMESTAMP, SYSTIMESTAMP)

-- pv_data

INSERT INTO pv_data (type_id, title, contact_fname, contact_lname, edata) VALUES (1, 'Asset Tracking App', null, null, 'edata1');

INSERT INTO pv_data (type_id, title, contact_fname, contact_lname, edata) VALUES (1, 'Payslips System', null, null, 'edata2');

INSERT INTO pv_data (type_id, title, contact_fname, contact_lname, edata) VALUES (2, 'Server Room Entry Code', null, null, 'edata3');

INSERT INTO pv_data (type_id, title, contact_fname, contact_lname, edata) VALUES (9, null, null, null, 'edata4');

INSERT INTO pv_data (type_id, title, contact_fname, contact_lname, edata) VALUES (7, null,'Jane', 'Doe', 'edata5');

--pv_files

INSERT INTO pv_files (data_id, file_ref, file_size) VALUES (1, 'fileref1', 200);

INSERT INTO pv_files (data_id, file_ref, file_size) VALUES (1, 'fileref2', 450);

-- pv_items

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (1, null, 1, 'ekey1', 11, 1, 1, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (1, null, 2, 'ekey2', 11, 1, 0, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (1, null, 3, 'ekey3', 11, 1, 0, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (1, null, 4, 'ekey4', 10, 1, 0, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (2, null, 5, 'ekey5', 11, 2, 0, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

INSERT INTO pv_items (user_id, privs_id, data_id, ekey, category_id, status_id, has_files, created_on, created_by, accessed_on, accessed_by, modified_on, modified_by) VALUES (1, 4, 5, 'ekey6', 11, 2, 0, SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com', SYSTIMESTAMP, 'todd.bottger@oracle.com');

COMMIT;