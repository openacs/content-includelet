ad_page_contract {

    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Unpublish this item

} {
    item_id:integer,notnull
}

db_dml q {update cr_items set live_revision = null where item_id = :item_id}

ad_returnredirect index?[ad_conn query]
