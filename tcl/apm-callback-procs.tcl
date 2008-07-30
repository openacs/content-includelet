ad_library {

    Lorsm Includelet Install library

    Procedures that deal with installing, instantiating, mounting.

    @creation-date 2007-01-10
    @author Don Baccus <dhogaza@pacifier.com>
    @cvs-id 
}

namespace eval content_includelet::install {}

ad_proc -private content_includelet::install::package_install {} {
    Package installation callback proc
} {

    db_transaction {

        # Need our own content type for search callbacks
        content::type::new \
            -content_type content_includelet_revision \
            -pretty_name "Content Includelet Text" \
            -pretty_plural "Content Includelet Text" \
            -table_name content_includelet_revisions \
            -id_column content_includelet_revision_id
 
        # User includelet
        layout::includelet::new \
            -name content_includelet \
            -description "Displays the content includelet" \
            -title "Content Includelet" \
            -application content-includelet \
            -template /packages/content-includelet/lib/content-includelet \
            -initializer content_includelet_utilities::configure_content_id

    }
}

ad_proc -private content_includelet::install::package_uninstall {} {
    Package uninstallation callback proc
} {
    layout::includelet::delete -name content_includelet
}

ad_proc -private content_includelet::install::after_upgrade {
    {-from_version_name:required}
    {-to_version_name:required}
} {

    Upgrade logic

} {
    apm_upgrade_logic \
	-from_version_name $from_version_name \
	-to_version_name $to_version_name \
	-spec {
        }
}
