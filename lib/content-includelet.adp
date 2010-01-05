<if @revision_id@ ne "">
  @content;noquote@
</if>

<if @edit_p@ true>
   <p>
     <a class="button" href="@edit_url@">#content-includelet.Edit_Content#</a>
   </p>

</if>
