<div class="box">
	<h2>More Products</h2>
	<ul>
<%
NavCategoriesRS.MoveFirst()
While ((Repeat_Cat__numRows <> 0) AND (NOT NavCategoriesRS.EOF)) 
%>
		<li><a href="listing.asp?Category=<%=(NavCategoriesRS.Fields.Item("CategoryID").Value)%>"><%=(NavCategoriesRS.Fields.Item("Category").Value)%></a></li>
<% 
  Repeat_Cat__index=Repeat_Cat__index+1
  Repeat_Cat__numRows=Repeat_Cat__numRows-1
  NavCategoriesRS.MoveNext()
Wend
%>
	</ul>
</div>