
ad_page_contract {

    Edit form for a content includelet's content
    
    @author Don Baccus (dhogaza@pacifier.com)
    @cvs_id $Id$
} 

# DRB: Note this is called only from the admin pages so permissions aren't
# checked.  Safe because the lib dir is not accessible via HTML.

set package_id [ad_conn package_id]

ad_form -name add-edit-form -export {element_id item_id revision_id} -form {
    {content:richtext \
        {label #content-includelet.Content#}
        {html {rows 20 cols 60 wrap soft}}
    }
} -on_request {
    if { $revision_id ne "" } {
        db_1row q {
            select content as old_content, mime_type
            from cr_revisions where revision_id = :revision_id
        }
        ad_set_element_value \
            -element content \
            [template::util::richtext::create $old_content $mime_type]
    }
} -on_submit {
    
    content::revision::new \
        -item_id $item_id \
        -content [template::util::richtext::get_property contents $content] \
        -mime_type [template::util::richtext::get_property format $content]

    ad_returnredirect index?[export_vars -url {item_id element_id}]
    ad_script_abort
}

ad_return_template
