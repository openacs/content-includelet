<?xml version="1.0"?>

<queryset>

  <fullquery name="content_includelet::install::after_upgrade.add_uninitializer_singleton_p">
    <querytext>
      update layout_includelets
      set uninitializer = 'content_includelet_utilities::delete_content_id',
        singleton_p = 'f'
      where name='content_includelet'
    </querytext>
  </fullquery>

</queryset>
