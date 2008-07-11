ad_page_contract {
    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Displays all options for editing a content includelet's content.

} {
    element_id:integer,notnull
    item_id:integer,notnull
    revision_id:integer,notnull
}

set context [list Edit]
