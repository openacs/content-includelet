ad_page_contract {
    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Set this revision to be live

} {
    item_id:integer,notnull
    revision_id:integer,notnull
}

content::item::set_live_revision -revision_id $revision_id

ad_returnredirect index?[ad_conn query]
