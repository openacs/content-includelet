ad_library {

    Search callbacks

    @author Don Baccus (dhogaza@pacifier.com)
    @cvs-id $Id$

}

ad_proc -public -callback search::datasource -impl content_includelet_revision {} {

    @author dhogaza@pacifier.com
    @creation_date 2007-11-15

    returns a datasource for the search package
    this is the content that will be indexed by the full text
    search engine.

} {
    db_1row datasource { }
    return [list object_id $object_id \
                title "" \
                content $data \
                relevant_date $publish_date \
                storage_type text \
                mime text/html]
}

ad_proc -public -callback search::url -impl content_includelet_revision {} {


    @author dhogaza@pacifier.com
    @creation_date 2007-11-15

    returns a url for a content portlet

} {
    db_1row node_id {}
    db_1row element_id {}
    set page_id [layout::element::get_column_value -element_id $element_id -column page_id]
    array set page [layout::page::get -page_id $page_id]
    set base [site_node::get_element -node_id $node_id -element url]
    return [export_vars -base $base {{pageset_id $page(pageset_id)} {page_num $page(sort_key)}}]
}

