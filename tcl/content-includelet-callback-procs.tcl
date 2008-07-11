ad_library {

    Search callbacks

    @author Don Baccus (dhogaza@pacifier.com)
    @cvs-id $Id$

}

ad_proc -public -callback search::datasource -impl content_portlet_revision {} {

    @author dhogaza@pacifier.com
    @creation_date 2007-11-15

    returns a datasource for the search package
    this is the content that will be indexed by the full text
    search engine.

} {
    db_1row q {
        select publish_date, data
        from cr_revisionsi
        where revision_id = :object_id
    }
    return [list object_id $object_id \
                title "" \
                content $data \
                relevant_date $publish_date \
                storage_type text \
                mime text/html]
}

ad_proc -public -callback search::url -impl content_portlet_revision {} {


    @author dhogaza@pacifier.com
    @creation_date 2007-11-15

    returns a url for a content portlet

} {
    db_1row q {
        select s.node_id
        from site_nodes s, site_nodes s1, cr_revisions r, cr_items i
        where r.revision_id = :object_id
          and i.item_id = r.item_id
          and s1.object_id = i.parent_id
          and s.node_id = s1.parent_id
    }
    db_1row q {
        select p.element_id
        from portal_element_parameters p, cr_revisions r
        where r.revision_id = :object_id
          and p.key = 'content_id'
          and p.value = r.item_id
    }
    set page_id [portal::element::get_page_id -element_id $element_id]
    array set page [portal::page::get -page_id $page_id]
    set base [site_node::get_element -node_id $node_id -element url]
    # Total kludge for The Learning Center
    return [export_vars -base $base  {{portal_id $page(portal_id)} {page_num $page(sort_key)}}]
}

