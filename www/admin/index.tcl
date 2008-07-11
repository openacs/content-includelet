ad_page_contract {
    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Displays all options for editing a content includelet's content.

} {
    item_id:integer,notnull
    element_id:integer,notnull
} -properties {
}

set package_id [ad_conn package_id]
set live_revision [content::item::get_live_revision -item_id $item_id]
set context [list Administer]

set page_title "Manage Content"
set name "Content Name"

db_multirow -extend {author_url} revisions revisions {
    select r.*, p.first_names || ' ' || p.last_name as author,
      p.person_id as user_id
    from cr_revisions r, persons p, acs_objects o
    where r.item_id = :item_id
      and o.object_id = r.revision_id
      and p.person_id = o.creation_user
    order by r.revision_id desc
} {
    set author_url [export_vars -base /shared/community-member {user_id}]
}
