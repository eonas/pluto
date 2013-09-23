<%@ page import="java.util.HashSet" %>
<%@page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://portals.apache.org/pluto" prefix="pluto" %>
<% pageContext.setAttribute("now", new java.util.Date()); %>

<%
    ServletRequest req = pageContext.getRequest();
    HashSet<String> renderedComponents = (HashSet<String>) req.getAttribute("de.eonas.portletbridge.renderedcomponents");

    if (renderedComponents == null) {
        renderedComponents = new HashSet<String>();
        req.setAttribute("de.eonas.portletbridge.renderedcomponents", renderedComponents);
    }

    renderedComponents.add("jquery/jquery.js");
    //renderedComponents.add("theme.css");

%>

<!DOCTYPE html>
<html>
<head>
    <title>Pluto</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">	
	<style type="text/css">
	#leftcol > * { margin-bottom: 20px; }
	
	/* Move down content because we have a fixed navbar that is 50px tall */
	body {
	  padding-top: 70px;
	  padding-bottom: 20px;
	}

	/* Set widths on the navbar form inputs since otherwise they're 100% wide */
	.navbar-form input[type="text"],
	.navbar-form input[type="password"] {
	  width: 180px;
	}

	/* Wrapping element */
	/* Set some basic padding to keep content from hitting the edges */
	.body-content {
	  padding-left: 15px;
	  padding-right: 15px;
	}

	/* Responsive: Portrait tablets and up */
	@media screen and (min-width: 768px) {
	  /* Let the jumbotron breathe */
	  .jumbotron {
		margin-top: 20px;
	  }
	  /* Remove padding from wrapping element since we kick in the grid classes here */
	  .body-content {
		padding: 0;
	  }
	}
	</style>
	
<!--script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script-->
<script src="<c:out value="${pageContext.request.contextPath}"/>/jquery.complete.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>

</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
		
			<a class="navbar-brand" href="#">Pluto</a>
		</div>
		
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" placeholder="Email" class="form-control">
            <input type="password" placeholder="Password" class="form-control">
            <button type="submit" class="btn">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->

	</div>
</div>

<div class="container">
<div class="row">

	<!-- left column -->
	<div class="col-sm-12 col-md-3" id="leftcol">

	<!-- include the left navigation menu -->

		<div class="panel panel-default">
			<div class="panel-heading">
				Menü
			</div>
			<div class="panel-body">
				<ul class="nav nav-pills nav-stacked">

					<c:forEach var="page" items="${driverConfig.pages}">
					<c:choose>
					<c:when test="${page == currentPage}">
					<li class="active">
							<a href='<c:out value="${pageContext.request.contextPath}"/>/portal/<c:out value="${page.name}"/>'><c:out
								    value="${page.name}"/></a>
						</li>
					</c:when>
					<c:otherwise>
					<li>
							<a href='<c:out value="${pageContext.request.contextPath}"/>/portal/<c:out value="${page.name}"/>'><c:out
								    value="${page.name}"/></a>
						</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>

	<!-- center column -->
	<div class="col-sm-8 col-md-6">
        <c:forEach var="portlet" varStatus="status"
                   items="${currentPage.portletIds}">
            <c:set var="portlet" value="${portlet}" scope="request"/>
            <jsp:include page="portlet-skin.jsp"/>
        </c:forEach>


	</div>
	
	<!-- right column -->
	<div class="col-sm-4 col-md-3">
        
		<div class="panel panel-default">
			<div class="panel-heading">
				Optionen
			</div>
			<div class="panel-body">
				Hier gibt's weitere Infos.
			</div>
			<div class="panel-footer">
				Hilfe
			</div>
		</div>
	</div>


</div>
</div>



</body>
</html>
