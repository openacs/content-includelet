<?xml version="1.0"?>

<queryset>

  <fullquery name="content_includelet_utilities::get_element_id.element_id">
    <querytext>
      select p.element_id
      from layout_element_parameters p, cr_revisions r
      where r.revision_id = :object_id
        and p.key like '%_id'
        and p.value::integer = r.item_id
    </querytext>
  </fullquery>

  <fullquery name="content_includelet_utilities::configure_content_id.item_exists">
    <querytext>
      select item_id
      from cr_items
      where parent_id = :package_id
        and content_type = 'content_includelet_revision'
    </querytext>
  </fullquery>
</queryset>
