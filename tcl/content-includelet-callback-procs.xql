<?xml version="1.0"?>

<queryset>

  <fullquery name="callback::search::datasource::impl::content_includelet_revision.datasource">
    <querytext>
      select publish_date, data
      from cr_revisionsi
      where revision_id = :object_id
    </querytext>
  </fullquery>

  <fullquery name="callback::search::url::impl::content_includelet_revision.node_id">
    <querytext>
      select s.node_id
      from site_nodes s, site_nodes s1, cr_revisions r, cr_items i
      where r.revision_id = :object_id
        and i.item_id = r.item_id
        and s1.object_id = i.parent_id
        and s.node_id = s1.parent_id
    </querytext>
  </fullquery>

  <fullquery name="callback::search::url::impl::content_includelet_revision.element_id">
    <querytext>
      select p.element_id
      from layout_element_parameters p, cr_revisions r
      where r.revision_id = :object_id
        and p.key like '%_id'
        and p.value = r.item_id
    </querytext>
  </fullquery>

</queryset>
