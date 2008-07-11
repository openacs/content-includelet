ad_page_contract {
    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Delete thie revision

} {
    revision_id:integer,notnull
}

content::revision::delete -revision_id $revision_id

ad_returnredirect index?[ad_conn query]
