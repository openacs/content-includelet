<?xml version="1.0"?>
<queryset>

  <fullquery name="revisions">
    <querytext>
      select to_char(r.publish_date, 'YYYY-MM-DD HH24:MI:SS') as publish_date,
        r.title, r.description, r.revision_id,
        p.first_names || ' ' || p.last_name as author, p.person_id as user_id
      from cr_revisions r, persons p, acs_objects o
      where r.item_id = :item_id
        and o.object_id = r.revision_id
        and p.person_id = o.creation_user
      order by r.revision_id desc
    </querytext>
  </fullquery>

</queryset>
