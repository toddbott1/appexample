select
    a.id item_id,
    a.id id_checkbox,
    case when instr(:SELECTEDROWS, '|' || a.id || '|') > 0 then 
      'checked' 
    else 
      '' 
    end selected,
    case
        when b.type_id = 7
            then (b.contact_fname || ' ' || b.contact_lname)
        when b.type_id = 9
            then TO_CHAR(a.created_on, 'YYYY-MM-DD HH24:MI:SS')
        else b.title
    end title,
    case
        when a.has_files = 1
            then 'fa fa-xs fa-paperclip'
    end title_files_icon,
    case
        when a.privs_id IS NOT NULL
            then 'fa fa-xs fa-share-alt'
    end title_share_icon,
    d.title type,
    c.title category,
    b.title raw_title,
    b.contact_fname,
    b.contact_lname,
    b.edata,
    case
        when a.privs_id is null
            then 'Owned by Me'
        else 'Shared with Me'
    end ownership,
    a.privs_id,
    e.title status,
    a.created_on,
    a.created_by,
    a.modified_on,
    a.modified_by,
    a.accessed_on,
    a.accessed_by
from pv_items a
    join pv_data b on (a.data_id = b.id)
    join pv_categories c on (a.category_id = c.id)
    join pv_seed_types d on (b.type_id = d.id)
    join pv_seed_statuses e on (a.status_id = e.id)
    join pv_users f on (a.user_id = f.id)
where
    (:PICK_OWNER is null or ((:PICK_OWNER = 1 and a.privs_id is null) or (:PICK_OWNER = 2 and a.privs_id is not null)))
    and (:PICK_CATEGORY is null or a.category_id = :PICK_CATEGORY)
    and (:PICK_TYPE is null or b.type_id = :PICK_TYPE)
    and (:PICK_STATUS is null or a.status_id = :PICK_STATUS)
    and f.email = lower(:APP_USER);