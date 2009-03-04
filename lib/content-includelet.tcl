ad_page_contract {

    The display logic for the content includelet
    
    Note: the optional revision_id queryvar is used by the admin "view revision" script
    to override the live version.  When included from the layout manager, the queryvar
    is not set, of course.

    @author Don Baccus (dhogaza@pacifier.com)
    @cvs_id $Id$
} {
    revision_id:optional
}

if { [info exists param_name] } {
    set item_id [set $param_name]
} else {
    set item_id $content_id
}

# Note: we really need a way to set the priv to check for, and to change
# perms on the content item...
set edit_p [permission::permission_p -object_id $item_id -privilege admin]

if { $edit_p} {
    set package_url [site_node::get_url_from_object_id -object_id $package_id]
    set edit_url ${package_url}/admin?[export_vars -url {element_id item_id}]
}

if { ![info exists revision_id] ||
     [content::revision::item_id -revision_id $revision_id] ne $item_id} {
    set revision_id [content::item::get_live_revision -item_id $item_id]
}

if { $revision_id ne "" } { 
    set content \
        [template::expand_percentage_signs [cr_write_content -string -revision_id $revision_id]]
}
