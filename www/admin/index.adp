<master>
  <property name="title">@page_title;noquote@</property>
  <property name="context">@context;noquote@</property
<p>

<table width="80%" align=center>
<tr><td colspan=3>
You can update the title and content of this page below.
Clicking on "OK" will make a new revision which will appear first in the
list of revisions for this content includelet.  Afterwards, you can review the
changes made by clicking on "View".  Clicking on "Publish" will then make
the currently viewed version of the content "live".
<p>
<p>
</td></tr>
<if @live_revision@ ne "">
  <tr><td><b>Live Version</b></td>
  <td width="100%">
  internal version id: @live_revision@ |
  <a href="view?element_id=@element_id@&item_id=@item_id@&revision_id=@live_revision@">view</a> |
  <a href="unpublish?element_id=@element_id@&item_id=@item_id@&revision_id=@live_revision@">unpublish</a>
&nbsp;</td></tr>
  <tr><td colspan=3>
    Create a new revision from the live revision:<p>
    <include src="/packages/content-includelet/lib/add-edit-form" &="item_id" &="element_id"
      revision_id="@live_revision@">
  </td></tr>
</if>
<else>
  <tr><td colspan=3>
    There is no live version - create a new revision:<p>
    <include src="/packages/content-includelet/lib/add-edit-form" &="item_id" &="element_id"
      revision_id="">
  </td></tr>
</else>
</table>
<p>

<p>

<if @revisions:rowcount@ ne 0>
<table width="80%" align=center>

<tr>
<td class=header>Internal Version ID</td>
<td class=header>Properties</td>
<td class=header>Actions</td>
</tr>

<multiple name="revisions">
<if @revisions.rownum@ odd>
	<tr bgcolor="#ececec">
</if>
<else>
	<tr>
</else>

<td valign="top">@revisions.revision_id@

<td valign="top">
Title: @revisions.title@<br>
Description: @revisions.description@<br>
Published: @revisions.publish_date@<br>
Author: <a href="@revisions.author_url@">@revisions.author@</a><br>
</td>

<td valign="top" nowrap>
<a href="view?element_id=@element_id@&item_id=@item_id@&revision_id=@revisions.revision_id@">view</a> |
<a href="edit?element_id=@element_id@&item_id=@item_id@&revision_id=@revisions.revision_id@">edit</a> |
<if @revisions.revision_id@ ne @live_revision@>
<a href="delete?element_id=@element_id@&item_id=@item_id@&revision_id=@revisions.revision_id@">delete</a> |
<a href="publish?element_id=@element_id@&item_id=@item_id@&revision_id=@revisions.revision_id@">publish</a>
</if>
<else>
<a href="unpublish?element_id=@element_id@&item_id=@item_id@&revision_id=@revisions.revision_id@">unpublish</a>
</else>

</tr>

</multiple>
</table>
</if>


