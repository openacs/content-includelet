ad_page_contract {
    @author Don Baccus (dhogaza@pacifier.com)
    @creation-date 2007-01-14

    Displays all options for editing a content includelet's content.

} {
    item_id:integer,notnull
    element_id:integer,notnull
} -properties {
}

set package_id [ad_conn package_id]
set live_revision [content::item::get_live_revision -item_id $item_id]
set context [list Administer]

set page_title "Manage Content"
set name "Content Name"

db_multirow -extend {author_url item_idx element_idx live_revisionx} revisions revisions {} {
    set author_url [export_vars -base /shared/community-member {user_id}]
    set publish_date [lc_time_fmt $publish_date "%x %X"]
    set item_idx $item_id
    set element_idx $element_id
    set live_revisionx $live_revision
}

template::list::create \
    -name revisions \
    -multirow revisions \
    -key revision_id \
    -elements {
        author {
            label {[_ content-includelet.Author]}
            display_template {
                <a href="@revisions.author_url@" title="@revisions.author@">@revisions.author@</a>
            }
        }
        publish_date {
            label {[_ content-includelet.Published]}
        }
        actions {
            label {[_ content-includelet.Action]}
            display_template {
                <a href="view?element_id=@revisions.element_idx@&item_id=@revisions.item_idx@&revision_id=@revisions.revision_id@" title="#content-includelet.View#" class="button">#content-includelet.View#</a>
                <a href="edit?element_id=@revisions.element_idx@&item_id=@revisions.item_idx@&revision_id=@revisions.revision_id@" title="#content-includelet.Edit#" class="button">#content-includelet.Edit#</a>
                <if @revisions.revision_id@ ne @revisions.live_revisionx@>
                  <a href="delete?element_id=@revisions.element_idx@&item_id=@revisions.item_idx@&revision_id=@revisions.revision_id@" title="#content-includelet.Delete#" class="button">#content-includelet.Delete#</a>
                  <a href="publish?element_id=@revisions.element_idx@&item_id=@revisions.item_idx@&revision_id=@revisions.revision_id@" title="#content-includelet.Publish#" class="button">#content-includelet.Publish#</a>
                </if>
                <else>
                <a href="unpublish?element_id=@revisions.element_idx@&item_id=@revisions.item_idx@&revision_id=@revisions.revision_id@" title="#content-includelet.Unpublish#" class="button">#content-includelet.Unpublish#</a>
                </else>
            }
        }
    }

