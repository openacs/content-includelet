<master>
  <property name="title">@page_title;noquote@</property>
  <property name="context">@context;noquote@</property
<p>

<table width="80%" align=center>
<tr><td colspan=3>
#content-includelet.Edit_intro#
<p>
<p>
</td></tr>
<if @live_revision@ ne "">
  <tr><td><b>#content-includelet.Live_Version#</b></td>
  <td width="100%">
  #content-includelet.ID#: @live_revision@
  <a href="view?element_id=@element_id@&item_id=@item_id@&revision_id=@live_revision@" title="#content-includelet.View#" class="button">#content-includelet.View#</a>
  <a href="unpublish?element_id=@element_id@&item_id=@item_id@&revision_id=@live_revision@" title="#content-includelet.Unpublish#" class="button">#content-includelet.Unpublish#</a>
</td></tr>
  <tr><td colspan=3>
    #content-includelet.Create_new_revision#<p>
    <include src="/packages/content-includelet/lib/add-edit-form" &="item_id" &="element_id"
      revision_id="@live_revision@">
  </td></tr>
</if>
<else>
  <tr><td colspan=3>
    #content-includelet.no_live_version#<p>
    <include src="/packages/content-includelet/lib/add-edit-form" &="item_id" &="element_id"
      revision_id="">
  </td></tr>
</else>
</table>
<p>

<p>

<if @revisions:rowcount@ ne 0>
<table width="80%" align=center>

</table>

<listtemplate name="revisions"></listtemplate>

</if>


