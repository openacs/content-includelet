ad_library {

    Some useful utilities for content includelets.

    @author Don Baccus (dhogaza@pacifier.com)
    @cvs-id $Id$

}

namespace eval content_includelet_utilities {}

ad_proc content_includelet_utilities::configure_content_id {
    element_id
    {parameter content_id}
} {
    Create the includelet's item and set the content_id param.

    @param element_id The content includelet
    @param parameter The parameter name to assign to the content item

} {
    set package_id [layout::element::get_column_value \
                       -element_id $element_id \
                       -column package_id]

    if { ![db_0or1row item_exists {} ] } {
        # Create the content item and stuff its id into the includelet.
 
        set item_id [content::item::new \
                        -name "Content For $package_id's $parameter" \
                        -parent_id $package_id \
                        -context_id $package_id \
                        -content_type content_includelet_revision \
                        -storage_type text]

    }

    layout::element::parameter::add_values \
        -element_id $element_id \
        -parameters [list $parameter $item_id]
}

ad_proc content_includelet_utilities::mount_and_configure_content_id {
    {-node_id ""}
    {-instance_name ""}
    {-pretty_name ""}
    element_id
    {parameter_id content_id}
} {
    Create the includelet's item and set the content_id param.

    @param element_id The content includelet

} {
    set package_id [subsite::auto_mount_application \
                        -node_id $node_id \
                        -instance_name $instance_name \
                        -pretty_name $pretty_name \
                        content-includelet]

    layout::element::parameter::set_column_value \
        -element_id $element_id \
        -column package_id \
        -value $package_id

    content_includelet_utilities::configure_content_id $element_id $parameter_id
    return $package_id
}
