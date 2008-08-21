<?xml version="1.0"?>

<queryset>

  <fullquery name="content_includelet_utilities::configure_content_id.item_exists">
    <querytext>
      select item_id
      from cr_items
      where parent_id = :package_id
        and content_type = 'content_includelet_revision'
    </querytext>
  </fullquery>
</queryset>
