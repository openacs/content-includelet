<?xml version="1.0"?>
<queryset>

  <fullquery name="content">
    <querytext>
      select content as old_content, mime_type
      from cr_revisions where revision_id = :revision_id
    </querytext>
  </fullquery>

</queryset>
