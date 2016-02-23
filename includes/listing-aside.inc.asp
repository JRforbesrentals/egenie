<aside class="toggler">
  <h2 class="toggle-link tl-related icon-toggle-dropdown">Brands</h2>
	<ul class="toggle-box tb-related">
		<li><a href="listing.asp?Category=<%response.write(rsMain__varCat) %>">All</a></li>
<%
NavSuppliersRS.MoveFirst()
While ((Repeat_Sup__numRows <> 0) AND (NOT NavSuppliersRS.EOF)) 
%>
		<li><a href="listing.asp?Category=<%response.write(rsMain__varCat) %>&make=<%=(NavSuppliersRS.Fields.Item("Supplier").Value)%>"><%=(NavSuppliersRS.Fields.Item("Supplier").Value)%></a></li>
<% 
  Repeat_Sup__index=Repeat_Sup__index+1
  Repeat_Sup__numRows=Repeat_Sup__numRows-1
  NavSuppliersRS.MoveNext()
Wend
%>
	</ul>
</aside>


<aside class="toggler"> 
  <h2 class="toggle-link tl-related icon-toggle-dropdown-open">Sort By</h2>
	<ul class="toggle-box tb-related tb-open">
		<li><a href="listing.asp?Category=<%response.write(rsMain__varCat) %>&make=<%response.write(rsMain__varMake) %>&Sort=rprice">Sort By Price</a></li>
		<li><a href="listing.asp?Category=<%response.write(rsMain__varCat) %>&make=<%response.write(rsMain__varMake) %>&Sort=type">Sort By Size</a></li>
	</ul>
</aside>


<aside class="toggler"> 
 <h2 class="toggle-link tl-related icon-toggle-dropdown">More Products</h2>
	<ul class="toggle-box tb-related">
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
</aside>