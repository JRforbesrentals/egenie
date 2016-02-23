<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../includes/config.asp" -->
<%
Dim rsMain__varModel
rsMain__varModel = "%"
If (Request.QueryString("model") <> "") Then 
  rsMain__varModel = Request.QueryString("model")
End If
%>
<%
Dim rsMain__varMake
rsMain__varMake = "%"
If (Request.QueryString("make") <> "") Then 
  rsMain__varMake = Request.QueryString("make")
End If
%>
<%
Dim rsMain__varStyle
rsMain__varStyle = "%"
If (Request.QueryString("style") <> "") Then 
  rsMain__varStyle = Request.QueryString("style")
End If
%>
<%
Dim rsMain__varCat
rsMain__varCat = "%"
If (Request.QueryString("Category") <> "") Then 
  rsMain__varCat = Request.QueryString("Category")
End If
%>
<%
Dim rsMain__varSort
rsMain__varSort = "make"
If (Request.QueryString("Sort") <> "") Then 
  rsMain__varSort = Request.QueryString("Sort")
End If
%>
<%
Dim rsMain
Dim rsMain_numRows

Set rsMain = Server.CreateObject("ADODB.Recordset")
rsMain.ActiveConnection = MM_rsMain_STRING
rsMain.Source = "SELECT P.*, S.Supplier, C.Category, C.CatText, C.CatImage, C.CatTitle, C.include FROM NewProducts P, Suppliers S, Categories C  WHERE P.Supplier = S.SupplierID AND P.Category = C.CategoryID AND model LIKE '%" + Replace(rsMain__varModel, "'", "''") + "%' AND make LIKE '%" + Replace(rsMain__varMake, "'", "''") + "%' AND style LIKE'" + Replace(rsMain__varStyle, "'", "''") + "' AND C.CategoryID LIKE'" + Replace(rsMain__varCat, "'", "''") + "' AND [current]=-1 AND [C.include]=-1 ORDER BY "&rsMain__varSort&" ASC, model"
rsMain.CursorType = 0
rsMain.CursorLocation = 2
rsMain.LockType = 1
rsMain.Open()

rsMain_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rsMain_numRows = rsMain_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rsMain_total
Dim rsMain_first
Dim rsMain_last

' set the record count
rsMain_total = rsMain.RecordCount

' set the number of rows displayed on this page
If (rsMain_numRows < 0) Then
  rsMain_numRows = rsMain_total
Elseif (rsMain_numRows = 0) Then
  rsMain_numRows = 1
End If

' set the first and last displayed record
rsMain_first = 1
rsMain_last  = rsMain_first + rsMain_numRows - 1

' if we have the correct record count, check the other stats
If (rsMain_total <> -1) Then
  If (rsMain_first > rsMain_total) Then
    rsMain_first = rsMain_total
  End If
  If (rsMain_last > rsMain_total) Then
    rsMain_last = rsMain_total
  End If
  If (rsMain_numRows > rsMain_total) Then
    rsMain_numRows = rsMain_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (rsMain_total = -1) Then

  ' count the total records by iterating through the recordset
  rsMain_total=0
  While (Not rsMain.EOF)
    rsMain_total = rsMain_total + 1
    rsMain.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (rsMain.CursorType > 0) Then
    rsMain.MoveFirst
  Else
    rsMain.Requery
  End If

  ' set the number of rows displayed on this page
  If (rsMain_numRows < 0 Or rsMain_numRows > rsMain_total) Then
    rsMain_numRows = rsMain_total
  End If

  ' set the first and last displayed record
  rsMain_first = 1
  rsMain_last = rsMain_first + rsMain_numRows - 1
  
  If (rsMain_first > rsMain_total) Then
    rsMain_first = rsMain_total
  End If
  If (rsMain_last > rsMain_total) Then
    rsMain_last = rsMain_total
  End If

End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rsMain
MM_rsCount   = rsMain_total
MM_size      = rsMain_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rsMain_first = MM_offset + 1
rsMain_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rsMain_first > MM_rsCount) Then
    rsMain_first = MM_rsCount
  End If
  If (rsMain_last > MM_rsCount) Then
    rsMain_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = MM_keepMove & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If

page_title = rsMain.Fields.Item("Model") & " " & rsMain.Fields.Item("Make") & " " & rsMain.Fields.Item("type")
page_keywords = rsMain.Fields.Item("Model") & rsMain.Fields.Item("Make") & rsMain.Fields.Item("type")
page_description = ""
%>
<!--#include file="../includes/header.inc.asp" -->
  <div class="wrapper">
  	<a href="#" id="togglemenu" class="icon-menu">Menu</a>
       	  <div class="headermobile clearfix">
            <a href="../index.asp"><img src="../images/forbes-rentals-logo.png" class="forbeslogo" alt="Forbes Rentals" /></a>
      		<p class="tel large">0800 00 63 00</p>
     	  </div>
  <div class="contentwrapper">
<div class="row clearfix">
       <div class="module clearfix">
         <div class="col-3 col-expanded">
         	
            
            <!--#include file="../includes/listing-aside.inc.asp" --> 
  

    
            
            
         </div>
         <div class="col-9 col-expanded">

   
<% If rsMain.BOF or rsMain.EOF Then
response.write("<p>Sorry but no products match your search.  Please try again.</p>")
response.write(Request.QueryString("Category"))
Else
%>
<h1>Student Rentals</h1>
<p>Here at Forbes Rentals we have special deals for students. If you are going off to University and want to have some home comforts, then why not rent a Washing Machine, Tumble Dryer or Television. Forbes Rentals have years of experience in renting to students wherever their place of residence. We offer rental contracts of 9 months, which includes installation, delivery and service calls.</p>

<ul class="productList">
	
<%
					startrw = 0
					endrw = HLooper1__index
					numberColumns = 3
					numrows =-1
					while((numrows <> 0) AND (Not rsMain.EOF))
						startrw = endrw + 1
						endrw = endrw + numberColumns
 						tdw = numberColumns/3

						While ((startrw <= endrw) AND (Not rsMain.EOF))
						%>
     <!--   <li> //-->
     
     
     

     
     
     
     
     
     
     
     
     
      <article class="product">     			          
        <a href="../product2.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsMain.Fields.Item("prodid").Value%>&Make=Student"><img src = "<%=(rsMain.Fields.Item("imageSmall").Value)%>" alt= "<%=(rsMain.Fields.Item("type").Value)%>" /></a>
        <div class="spec"><a href="../product2.asp?<%= Server.HTMLEncode(MM_keepNone) & MM_joinChar(MM_keepNone) & "prodid=" & rsMain.Fields.Item("prodid").Value%>&Make=Student"><%=(rsMain.Fields.Item("Make").Value)%><br><%=(rsMain.Fields.Item("Model").Value)%><br>
          <%=(rsMain.Fields.Item("Type").Value)%></a>
                              
                              
          <% If Not(rsMain.Fields.Item("specialprice").Value)=0 Then %><p class="special">Special Rate</p>
<p class="rentalprice"><%= FormatCurrency((rsMain.Fields.Item("Specialprice").Value), 2, -2, -2, -2) %></span> Rental per week</p>
		<% Else %><p>Weekly Rental<br />
        <span class="rentalprice"><%= FormatCurrency((rsMain.Fields.Item("rprice").Value), 2, -2, -2, -2) %></span><br/></p>
	<% End If %>
	     <% If Not(rsMain.Fields.Item("specialprice").Value)=0 Then %>                
         <p class="small">Normal Price: <del><%= FormatCurrency((rsMain.Fields.Item("rprice").Value), 2, -2, -2, -2) %></del>
         <% End If %></span></div>
                            
                            
  <!--    </li> //-->
			</article>	 		
      <%
						startrw = startrw + 1
						rsMain.MoveNext()
						Wend

 						numrows=numrows-1
 					Wend
 					%>
<!-- </ul> //-->


<%
rsMain.Close()
Set rsMain = Nothing
End If
%>





        </div>         
       </div>
     </div>
    </div> <!-- contentwrapper //-->
<footer>
     <div class="contentwrapper">
       <div class="row cleafix">
        <div class="col-12">
          <h1>Help &amp; Support</h1>
        </div>
       </div>
       <div class="row cleafix">
        <ul class="support col-4">
          <li><a href="../contact.asp#callback">Book a Callback</a></li>
          <li><a href="../contact.asp#sales">Sales &amp; Advice</a></li>
        </ul>
        <ul class="support col-4">
          <li><a href="../contact.asp#service">Service &amp; Customer Care</a></li>
          <li><a href="../contact.asp#payments">Payments &amp; Accounts</a></li>
        </ul>
        <ul class="support col-4">
          <li><a href="#">Apply Online</a></li>
          <li><a href="../contact.asp#postal">Postal Address</a></li>
         </ul><div class="clearfix"></div>
       </div>
   		<div class="row clearfix socialmodule">   
       <div class="col-4">
            <img src="../images/forbes-logo-grey.png" alt="Forbes Rentals logo" class="forbes-logo" />
       </div>
       <div class="col-4">
         <p class="familyrun">Family Run Since 1926</p>
         <ul class="social">
           <li><a href="https://twitter.com/forbesrentals" class="twitter">Twitter</a></li>
           <li><a href="https://www.facebook.com/pages/Forbes-Rentals/119930192256" class="facebook">Facebook</a></li>
           <li><a href="https://www.youtube.com/user/ForbesRentals" class="youtube">Youtube</a></li>
           <li><a href="http://forbes-rentals.tumblr.com/" class="tumblr">Tumblr</a></li>
         </ul>
        </div>
        <div class="col-4">
          <img src="../images/forbes-85years-grey.png" alt="Forbes 85 Years Service" class="forbes85" />
        </div>
      </div>
      <div class="row clearfix">
        <div class="col-12">
          <ul class="logos clearfix">
            <li class="samsung">Samsung</li>
            <li class="toshiba">Toshiba</li>
            <li class="philips">Philips</li>
            <li class="linsar">Linsar</li>
            <li class="panasonic">Panasonic</li>
            <li class="bosch">Bosch</li>
            <li class="humax">Humax</li>
            <li class="shoprider">Shoprider</li>
     	  </ul>
        </div>
       </div>      
   	   <div class="row clearfix">
        <div class="col-12">
         <ul class="seo">
          <li><a href="../cooker-rental.asp">Cooker Rental</a></li>
          <li><a href="../dishwasher-rental.asp">Dishwasher Rental</a></li>
          <li><a href="../dryer-rental.asp">Tumble Dryer Rental</a></li>
          <li><a href="../washer-dryer-rental.asp">Washer Dryer Rental</a></li>
          <li><a href="../washing-machine-rental.asp">Washing Machine Rental</a></li>
          <li><a href="../LCD-Television-Rental.asp">LCD Television Rental</a></li>
          <li><a href="../LED-Television-Rental.asp">LED Television Rental</a></li>
          <li><a href="../Plasma-Television-Rental.asp">Plasma Television Rental</a></li>
          <li><a href="../freeview-hd-box-rental.asp">Freeview HD box Rental</a></li>
          <li><a href="../smart-tv-rental.asp">Smart TV Rental</a></li>
          <li><a href="../Blu-Ray-and-DVD-rental.asp">Blu-Ray and DVD</a></li>
          <li><a href="../freezer-rental.asp">Freezer Rental</a></li>
          <li><a href="../fridge-rental.asp">Fridge Rental</a></li>
          <li><a href="../fridge-freezer-rental.asp">Fridge Freezer Rental</a></li>
          <li><a href="../student.asp">Student Rental</a></li>
          <li><a href="../ebay.asp">eBay</a></li>
       </ul>
      </div>
     </div>
   	 <div class="row clearfix">
       <div class="col-12">    
        <p class="small">Copyright &copy; 2015 F Donald Forbes &amp; Co Ltd T/A Forbes Rentals, 7 Wells Place, Redhill, Surrey. RH 1 3DR. Registered England 687172</p>
    	<p class="small">Forbes Rentals is authorised and regulated by the Financial Conduct Authority. It is a member of the Consumer Credit Trade Association and abides by its Code of Practice</p>   
       </div>
     </div>        
	</div> <!-- contenwrapper //-->
 </footer>
</div> <!-- wrapper //-->  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="../scripts/forbes.js"></script>
    <!--[if IE 9]>
    	<script src="/responsive/scripts/ie9.js"></script>
    <![endif]-->
 </body>
</html>       